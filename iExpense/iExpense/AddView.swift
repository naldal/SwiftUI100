//
//  AddView.swift
//  iExpense
//
//  Created by 송하민 on 2/15/24.
//

import SwiftUI

struct AddView: View {
    
    @State private var name = ""
    @State private var type = ""
    @State private var amount = 0.0
    
    var expenses: Expense

    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expense())
}
