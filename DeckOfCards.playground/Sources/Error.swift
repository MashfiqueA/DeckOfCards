//
//  Error.swift
//
//
//  Created by Mashfique Anwar on 6/28/17.
//
//

/**
 Errors for `Card` type
 
 - invalidRank: for rank not between 0 and 12 (inclusive)
 - invalidSuit: for suit not between 0 and 3 (inclusive)
 */
public enum CardError: Error {
    case invalidRank
    case invalidSuit
}


/**
 Errors for `Deck` type
 
 - cannotShuffle: raised when deck cannot be shuffled
 - cannotDeal:    raised when a card cannot be dealt from deck
 */
public enum DeckError: Error {
    case cannotShuffle
    case cannotDeal
}
