//
//  ContentView.swift
//  Bataille
//
//  Created by Steven Vallarsa on 7/8/23.
//

import SwiftUI

func getRandomCard() -> Int {
    return Int.random(in: 2...14)
}

struct ContentView: View {
    @State private var playerScore = 0
    @State private var cpuScore = 0
    @State private var playerCards = 26
    @State private var cpuCards = 26
    @State private var playerCard = getRandomCard()
    @State private var cpuCard = getRandomCard()
    @State private var statement = "Round 1"
    @State private var isGameOver = false

    var body: some View {
        ZStack {
            Image("background-cloth").resizable().ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image("card" + String(playerCard))
                    Spacer()
                    Image("card" + String(cpuCard))
                    Spacer()
                }
                Spacer()
                Button(action: {
                    
                    playerCard = getRandomCard()
                    cpuCard = getRandomCard()
                    
                    if playerCard == cpuCard {
                        statement = "Tie"
                    } else if playerCard > cpuCard {
                        statement = "You Win This Round"
                        playerScore += 1
                        playerCards += 1
                        cpuCards -= 1
                    } else {
                        statement = "The CPU Wins This Round"
                        cpuScore += 1
                        cpuCards += 1
                        playerCards -= 1
                    }
                    
                    if playerCards == 52 {
                        statement = "YOU WIN"
                        isGameOver = true
                    } else if cpuCards == 52 {
                        statement = "CPU WINS"
                        isGameOver = true
                    }
                    
                    
                    
                }) {Image("button")}.disabled(isGameOver)
                Spacer()
                Text(statement).fontWeight(.black).foregroundColor(.cyan)
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .padding(.bottom, 11.0)
                        Text(String(playerScore))
                            .font(.title)
                            .fontWeight(.bold)
                        Text("\(String(playerCards)) cards")
                            .padding(.top, 1.0)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .padding(.bottom, 11.0)
                        Text(String(cpuScore))
                            .font(.title)
                            .fontWeight(.bold)
                        Text("\(String(cpuCards)) cards")
                            .padding(.top, 1.0)
                    }
                    Spacer()
                }.foregroundColor(.white)
//                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
