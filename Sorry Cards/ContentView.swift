//
//  ContentView.swift
//  Sorry Cards
//
//  Created by Blake on 4/12/20.
//  Copyright © 2020 Keeper. All rights reserved.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var showingCard: Int = 0
    @State var deck: [String]
    var shuffleSound: AVAudioPlayer
    var cardFlip: AVAudioPlayer
    @State var angle: Double = 0
    
    
    var body: some View {
        VStack {
            Spacer(minLength: 25)
            if showingCard == 0 {
                Color(.black)
                    .animation(.easeInOut)
            } else {
                Image(deck[showingCard])
                    .resizable().scaledToFit()
                    .rotationEffect(.degrees(self.angle))
                    .imageScale(.large)
                    .animation(.easeInOut)
                    
            }
            Spacer()
            Button(action: {
                    if self.showingCard < self.deck.count - 1 {
                        let counter = self.showingCard
                        self.showingCard = 0
                        self.angle = -10
                        self.angle += Double.random(in: 1...20)
                        do { sleep(1)}
                        self.showingCard = counter + 1
                        self.playCardFlip()
                    } else {
                        self.deck.shuffle()
                        self.playShuffleSound()
                        self.showingCard = 0
                        
                            
                    }
                }) {
                Text("Draw")
                    .fontWeight(.bold)
                    .font(.title)
                    .frame(width: 300, height:100)
                    .background(Color.red)
                    .foregroundColor(.black)
            }
        }
        .background(Color.black)
        
    }
    
    func playShuffleSound() {
        shuffleSound.play()
    }
    
    func playCardFlip() {
        cardFlip.play()
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       // ContentView(deck: ["Sorry!"])
        ContentView(deck: ["Sorry"], shuffleSound:AVAudioPlayer(), cardFlip:AVAudioPlayer())
    }
}
