//
//  CardSwagger.swift
//  Escarmoosh
//
//  Created by Arnaud Verrier on 21/01/2019.
//  Copyright © 2019 escarmoosh. All rights reserved.
//

import Foundation

class CardSwagger: CardStoreProtocol {
    
    func fetchCard(with id: String, completionHandler: @escaping ((CardModel?, Error?) -> Void)) {
        
        CardAPI.cardGet(cardId: id, completion: completionHandler)
    }
    
    func fetchCards(completionHandler: @escaping (([CardModel]?, Error?) -> Void)) {
        
        
    }
}
