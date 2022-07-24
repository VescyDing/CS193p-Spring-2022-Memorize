//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 丁文星 on 2022/7/17.
//

import SwiftUI

let emojis = ["👻", "🎃", "🕷️"]

class EmojiMemoryGame: ObservableObject {
    // i was writed this commit twice, cus i was lose my Lecture2 commit in rename ContentView with Xcode, it was f**king terrible
    // and, in frist commit, i was not so understanted the mean about this 'in'. but im not obsessed with this right now
    // i just think about why there last function or args can write by this form, where scene it will be work?
    @Published private var model: MemoryGame<String> = MemoryGame(numberOfCards: emojis.count) { index in emojis[index] }
    
    // @Published: every time this property, this model changes, it calls objectWillChange.send()
    
    // anoter way is using private(set) to achieve readOnly, so that this function will be disappear
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
