//
//  ContentView.swift
//  WordScramble
//
//  Created by 송하민 on 2/18/24.
//

import SwiftUI

struct ContentView: View {

    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score = 0
    
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .onSubmit {
                self.addNewWord()
            }
            .onAppear(perform: {
                self.startGame()
            })
            .alert(errorTitle, isPresented: $showingError) { } message: {
                Text(errorMessage)
            }
            
            VStack {
                Text("Your score is \(self.score)")
            }
            .padding(20)
            .navigationTitle(rootWord)
            .toolbar(content: {
                Button("startGame") {
                    self.startGame()
                }
            })
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "word used already", message: "be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "word not recoginzed", message: "You can't just make them up, you know!")
            return
        }
        
        guard isNoPrefixOfRoot(word: answer) else {
            wordError(title: "word is prefix of root string", message: "You shouldn't use prefix of the root word!")
            return
        }
        
        guard isLongEnough(word: answer) else {
            wordError(title: "word is too short", message: "word is too short.")
            return
        }
        self.score += answer.count
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""
    }
    
    func startGame() {
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isLongEnough(word: String) -> Bool {
        guard word.count > 3 else { return false }
        return true
    }
    
    func isNoPrefixOfRoot(word: String) -> Bool {
        guard !rootWord.hasPrefix(word) else { return false }
        return true
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let missspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return missspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

#Preview {
    ContentView()
}
