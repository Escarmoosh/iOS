//
//  CardWorker.swift
//  Escarmoosh
//
//  Created by Arnaud Verrier on 21/01/2019.
//  Copyright (c) 2019 escarmoosh. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CardStoreProtocol {
    
    func fetchCard(with id: String, completionHandler: @escaping ((_ card: Card?,_ error: Error?) -> Void))
    func fetchCards(completionHandler:  @escaping ((_ cards: [Card]?,_ error: Error?) -> Void))
}

enum CardStoreError: Error {
    
    case createCardError(localizedDescription: String?)
    case fetchCardsError(localizedDescription: String?)
    case fetchCardError(localizedDescription: String?)
    case UnkownError
}

class CardWorker
{
    var cardStore: CardStoreProtocol
    
    init(cardStore:CardStoreProtocol) {
        
        self.cardStore = cardStore
    }
    
    func fetchCard(with id: String, completionHandler: @escaping ((_ card: Card?,_ error: Error?) -> Void))
    {
        self.cardStore.fetchCard(with: id, completionHandler: completionHandler)
    }
    
    func fetchCards(completionHandler:  @escaping ((_ cards: [Card]?,_ error: Error?) -> Void))
    {
        self.cardStore.fetchCards(completionHandler: completionHandler)
    }
}
