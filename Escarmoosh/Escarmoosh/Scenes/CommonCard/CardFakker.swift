//
//  CardFakker.swift
//  Escarmoosh
//
//  Created by Arnaud Verrier on 21/01/2019.
//  Copyright © 2019 escarmoosh. All rights reserved.
//

import Foundation

class CardFakker: CardStoreProtocol {
    
    func fetchCard(with id: String, completionHandler: @escaping ((Card?, Error?) -> Void))
    {
        do {
            let card = try self.createFakeCard(_id: id, firstName: "Arnaud", lastName: "Verrier", club: "Bondy", birthday: "1984-12-20", category: "Senior", hand: "Droite", weapon: "Epee", grip: "Crosse")
            completionHandler(card, nil)
        } catch let error as CardStoreError {
            
            completionHandler(nil, error);
        } catch {
            
            completionHandler(nil, CardStoreError.UnkownError)
        }
    }
    
    func fetchCards(completionHandler: @escaping (([Card]?, Error?) -> Void))
    {
        var card: [Card] = Array()
        
        do {
            try card.append(self.createFakeCard(_id: "0", firstName: "Arnaud", lastName: "Verrier", club: "Bondy", birthday: "1984-12-20", category: "Senior", hand: "Droite", weapon: "Epee", grip: "Crosse"))
            try card.append(self.createFakeCard(_id: "1", firstName: "Arnaud", lastName: "Verrier", club: "Bondy", birthday: "1984-12-20", category: "Senior", hand: "Droite", weapon: "Epee", grip: "Crosse"))
            try card.append(self.createFakeCard(_id: "2", firstName: "Arnaud", lastName: "Verrier", club: "Bondy", birthday: "1984-12-20", category: "Senior", hand: "Droite", weapon: "Epee", grip: "Crosse"))
            try card.append(self.createFakeCard(_id: "3", firstName: "Arnaud", lastName: "Verrier", club: "Bondy", birthday: "1984-12-20", category: "Senior", hand: "Droite", weapon: "Epee", grip: "Crosse"))
            try card.append(self.createFakeCard(_id: "4", firstName: "Arnaud", lastName: "Verrier", club: "Bondy", birthday: "1984-12-20", category: "Senior", hand: "Droite", weapon: "Epee", grip: "Crosse"))
            
            completionHandler(card, nil)
        } catch let error as CardStoreError {
            
            completionHandler(nil, error);
        } catch {
            
            completionHandler(nil, CardStoreError.UnkownError)
        }
    }
    
    func createFakeCard(_id: String, firstName: String, lastName: String, club: String, birthday: String, category: String, hand: String, weapon: String, grip: String) throws -> Card
    {
        let formatter = Configuration.dateFormatter;
        guard let bDayDate = formatter.date(from: birthday) else {
            
            throw CardStoreError.createCardError(localizedDescription: NSLocalizedString("date_format", comment: "BDay date use bad format"))
        }
        
        let card1 = Card(_id: "0", firstName: "Arnaud", lastName: "Verrier", club: "Bondy", birthday: bDayDate, category: "Senior", hand: "Droite", weapon: "Epee", grip: "Crosse", card: nil)
        return card1
    }
}
