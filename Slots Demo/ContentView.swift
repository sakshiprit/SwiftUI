//
//  ContentView.swift
//  Slots Demo
//
//  Created by Pritam Bolenwar on 16/10/20.
//

import SwiftUI

struct ContentView: View {
    @State private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [1, 2, 0]
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    @State private var credits = 1000
    private var betAmount = 5
    
    var body: some View {
        
        ZStack {
            
            //Background
            Rectangle()
                .foregroundColor(Color(red:200/255, green: 143/255, blue:32/255))
                .ignoresSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red:228/255, green:195/255, blue:76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Spacer()

                
                //Title
                
                HStack {
                    Image(systemName: "star.fil")
                        .foregroundColor(.yellow)
                    
                    Text("SwiftUI Slots")
                        .bold()
                        .foregroundColor(.white)
                    
                    
                    Image(systemName: "star.fil")
                        .foregroundColor(.yellow)
                    
                }.scaleEffect(2)
                
                Spacer()

                
                // Credits counter
                
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()

                
                 // cards
                HStack{
                     Spacer()
                    
                    Cardview(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                    
                    Cardview(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                    
                    Cardview(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                    
                    
                        
                    
                    Spacer()
                }
                Spacer()
                // Button
  
               Button(action: {
                    
                    //Change the bakground back to white
                    self.backgrounds = self.backgrounds.map { _ in
                        Color.white
                    }
                    
                    //Change the images
                    self.numbers = self.numbers.map({ _ in
                        Int.random(in:0...self.symbols.count - 1)
                    })
                    
                    // Check the winnings
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        
                        //won
                        
                        self.credits += self.betAmount * 10
                        
                        // update background
                        self.backgrounds = self.backgrounds.map {_ in Color.green
                     }
                    }
                        
                    else {
                        self.credits -= self.betAmount
                    }
                }){
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading,.trailing] , 30)
                        .background(Color.pink)
                        .cornerRadius(20)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

