//
//  ContentView.swift
//  Memorize
//
//  Created by 丁文星 on 2022/7/2.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(0..<4) {
                index in CardView(isFaceUp: false)
                
            }
        }.padding().foregroundColor(Color.orange).font(Font.largeTitle)
    }
}

struct CardView: View {
    var isFaceUp: Bool
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text("👻")
                
            } else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
    }
}
