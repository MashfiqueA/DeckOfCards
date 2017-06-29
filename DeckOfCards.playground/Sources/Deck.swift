//
//  Deck.swift
//  
//
//  Created by Mashfique Anwar on 6/28/17.
//
//

import UIKit

public class Deck {
    /// List of cards in the deck
    private var cards: [Card]
    
    /// Number of cards already used in the deck
    private var count: Int
    
    
    /**
     Makes a list containing 52 different Cards,
     representing the undealt cards in the deck
     
     - Returns: An object of type Deck
     */
    public init() {
        var tempCards: [Card] = []
        for rank in 0...12 {
            for suit in 0...3 {
                let card = try! Card(rank: rank, suit: suit)
                tempCards.append(card)
            }
        }
        self.cards = tempCards
        self.count = 0
    }
    
    
    /**
     Shuffle the list of cards based on the Fisher-Yates algorithm
     
     - Throws: `DeckError` if cards have already been dealt
     - Returns: Void
     */
    public func shuffle() throws -> Void {
        if count != 0 {
            throw DeckError.cannotShuffle
        }
        
        for index in (1..<cards.count).reversed() {
            let otherIndex = random(max: index + 1)
            let temp: Card = cards[index]
            cards[index] = cards[otherIndex]
            cards[otherIndex] = temp
        }
    }
    
    
    /// Checks if there are available cards to be dealt from the deck
    public func canDeal() -> Bool {
        return count < cards.count
    }
    
    
    /**
     Deals one card from the deck
     
     - Throws: `DeckError` if no cards left in the deck
     - Returns: Dealt `Card` from the top of the deck
     */
    public func dealOneCard() throws -> Card {
        if !canDeal() {
            throw DeckError.cannotDeal
        }
        let card = cards[count]
        count += 1
        return card
    }
    
    
    /// Returns a pseudo-random number between 0 and maxNumber
    private func random(max maxNumber: Int) -> Int {
        return Int(arc4random_uniform(UInt32(maxNumber)))
    }
}
