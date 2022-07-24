//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by 丁文星 on 2022/7/2.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView()
    }
}

struct EmojiMemoryGameView: View {
    // @ObservedObject: every time somes says objectWillchange.send(), it redraw (同时也是比较式的最少化更新)
    @ObservedObject var viewModel: EmojiMemoryGame = EmojiMemoryGame()
    
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
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
    var body: some View {
        GeometryReader(content: { geomtry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }.font(Font.system(size: min(geomtry.size.width, geomtry.size.height) * fontScaleFactor))
        })
    }
}
