//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 송하민 on 2/11/24.
//

import SwiftUI


struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.red)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(TitleModifier())
    }
}

struct FlagImage: View {
    
    var country: String
    
    var body: some View {
        Image(country)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    
    @State var countries = [
        "Estonia",
        "France",
        "Germany",
        "Ireland",
        "Italy",
        "Nigeria",
        "Poland",
        "Spain",
        "UK",
        "Ukraine",
        "US"
    ].shuffled()
 
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var leftQuestion = 8
    @State private var isShowingFinalScore: Bool = false
    
    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
                ],
                center: .top,
                startRadius: 200,
                endRadius: 700
            )
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the FLag")
                    .titleStyle()
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(country: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 40)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Countinue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Done!", isPresented: $isShowingFinalScore) {
            Button("Reset the game", action: resetGame)
        } message: {
            Text("Your final score is \(self.score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            self.score += 1
        } else {
            scoreTitle = "Wrong!\nThat's the flag of \(countries[number])"
        }
        showingScore = true
    }
    
    func askQuestion() {
        self.leftQuestion -= 1
        
        guard self.leftQuestion > 0 else {
            self.isShowingFinalScore = true
            self.showingScore = false
            return
        }
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        self.isShowingFinalScore = false
        self.score = 0
        self.leftQuestion = 8
        self.askQuestion()
    }
}

#Preview {
    ContentView()
}
