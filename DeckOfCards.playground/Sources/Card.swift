//
//  Card.swift
//
//
//  Created by Mashfique Anwar on 6/28/17.
//
//


/** 
 Struct representing Card (Conforms to the CustomStringConvertible
 protocol to support description string, refer to class definition below)
*/
public struct Card: CustomStringConvertible {
    /// Printable rank names
    let rankName: [String] = [
        "ace",     //   0
        "two",     //   1
        "three",   //   2
        "four",    //   3
        "five",    //   4
        "six",     //   5
        "seven",   //   6
        "eight",   //   7
        "nine",    //   8
        "ten",     //   9
        "jack",    //  10
        "queen",   //  11
        "king"     //  12
    ]
    
    /// Printable suit names
    let suitName: [String] = [
        "spade",   //  0
        "heart",   //  1
        "diamond", //  2
        "club"     //  3
    ]
    
    ///  Card rank, between 0 and 12 (inclusive).
    let rank: Int
    
    /// Card suit, between 0 and 3 (inclusive).
    let suit: Int
    
    
    /**
     Initializes a Card based on rank and suite
     
     - Parameters:
        - rank: The rank of the card (Ace, 2-10, Jack, Queen & King)
        - suit: The suit of the card (Hearts, Spades, Clubs or Diamonds)
     - Throws: Relevant `CardError` on invalid rank or suit
     - Returns: An object of type `Card`
     */
    init(rank: Int, suit: Int) throws {
        guard 0 <= rank && rank <= 12 else {
            throw CardError.invalidRank
        }
        guard 0 <= suit && suit <= 3 else {
            throw CardError.invalidSuit
        }
        
        self.rank = rank
        self.suit = suit
    }
    
    
    /// Returns a textual representation of Card.
    /// For example, "queen of diamonds" or "ace of hearts".
    public var description: String {
        return rankName[rank] + " of " + suitName[suit] + "s"
    }
}

