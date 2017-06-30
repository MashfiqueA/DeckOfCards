//
//  This playground demonstrates the usage of the Deck class
//
//  Created by Mashfique Anwar on 6/28/17.
//
//

import UIKit


//--------------- Deal cards without shuffling ----------------- //

print("---- Deck 1 (not shuffled) ----")
let deck1 = Deck()

// Deal all the cards from the deck
while deck1.canDeal() {
    if let card = try? deck1.dealOneCard() {
        print("dealt \(card)")
    }
}


// ------------------- Deal cards by shuffling ----------------- //
print("\n---- Deck 2 (shuffled) ----")
let deck2 = Deck()
do {
    // Shuffle the deck
    try deck2.shuffle()
    
    // Deal all 52 cards from the deck
    while deck2.canDeal() {
        if let card = try? deck2.dealOneCard() {
            print("dealt \(card)")
        }
    }
    
    // Try dealing a 53rd card. This raises the DeckError.cannotDeal
    // error handled below
    _ = try deck2.dealOneCard()
    
}
catch DeckError.cannotShuffle {
    // Handle error
    print("cannot shuffle deck")
}
catch DeckError.cannotDeal {
    // Handle error
    print("cannot deal cards from the deck")
}
