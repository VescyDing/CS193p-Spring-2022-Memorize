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
    var viewModel: EmojiMemoryGame = EmojiMemoryGame()
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) {
                card in CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }.padding().foregroundColor(Color.orange).font(Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.content)
                
            } else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
    }
}
