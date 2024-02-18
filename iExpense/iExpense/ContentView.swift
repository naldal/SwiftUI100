//
//  ContentView.swift
//  iExpense
//
//  Created by 송하민 on 2/13/24.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expense {
    var items: [ExpenseItem] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}

struct ContentListView: View {
    
    @State var item: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }
            Spacer()
            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .foregroundStyle(styleForAmount(amount: item.amount))
        }
    }
    
    func styleForAmount(amount: Double) -> Color {
        if amount < 10 {
            return .blue
        } else if amount < 100 {
            return .red
        } else {
            return .purple
        }
    }
}

struct ContentView: View {
    
    @State private var expenses = Expense()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal Expenses") {
                    ForEach(expenses.items.filter { $0.type == "Personal" }) { item in
                        ContentListView(item: item)
                    }
                    .onDelete(perform: { offsets in
                        removeItems(at: offsets, ofType: "Personal")
                    })
                }
                
                Section("Business Expenses") {
                    ForEach(expenses.items.filter { $0.type == "Business" }) { item in
                        ContentListView(item: item)
                    }
                    .onDelete(perform: { offsets in
                        removeItems(at: offsets, ofType: "Business")
                    })
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button(action: {
                    showingAddExpense = true
                }) {
                    Label("Add Expense", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet, ofType type: String) {
        let itemsOfType = expenses.items.enumerated().filter { $0.element.type == type }.map { $0.offset }
        let offsetsToBeDeleted = offsets.compactMap { itemsOfType[$0] }
        expenses.items.remove(atOffsets: IndexSet(offsetsToBeDeleted))
    }
}

#Preview {
    ContentView()
}
