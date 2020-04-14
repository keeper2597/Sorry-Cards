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
                
                Button(action: {
                    if self.showingCard < self.deck.count - 1 {
                        let counter = self.showingCard
                        self.showingCard = 0
                        self.angle = -15
                        self.angle += Double.random(in: 1...30)
                        
                        self.showingCard = counter + 1
                        self.playCardFlip()
                        
                    } else {
                        
                        self.deck.shuffle()
                        self.playShuffleSound()
                        self.showingCard = 1
                        
                            
                    }
                }) {
                    if showingCard == 0 {
                        Text("Tap to Draw")
                            .foregroundColor(Color(white:0.8))
                            .fontWeight(.black)
                            .font(.largeTitle)
                            
                    } else {
                        
                        ImageView(showingCard: deck[showingCard], angle: angle)

                        }
                    }.buttonStyle(PlainButtonStyle())
                    .transition(.move(edge: .trailing))
                    .frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: .infinity, maxHeight: .infinity, alignment: .center)
                Spacer(minLength: 25)
            
            
        
        
        }.background(Color.black)
                .edgesIgnoringSafeArea(.all)
    }
    
    func playShuffleSound() {
        shuffleSound.play()
    }
    
    func playCardFlip() {
        cardFlip.play()
    }
    
}

struct ImageView : View {

    @State var showAction = false
    var showingCard: String
    var angle: Double

    var body: some View {
        Image(showingCard)
            .resizable()
            .scaledToFit()
            .rotationEffect(.degrees(self.showAction ? 360.0 : 0.0))
            .animation(self.showAction ? Animation.linear(duration: 0.15) : nil)
            .rotationEffect(.degrees(angle))
        .onAppear() {
            self.showAction = true
        }
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       // ContentView(deck: ["Sorry!"])
        ContentView(deck: ["Sorry"], shuffleSound:AVAudioPlayer(), cardFlip:AVAudioPlayer())
    }
}
