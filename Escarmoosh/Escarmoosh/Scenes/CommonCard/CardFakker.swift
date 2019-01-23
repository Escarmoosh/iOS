//
//  CardFakker.swift
//  Escarmoosh
//
//  Created by Arnaud Verrier on 21/01/2019.
//  Copyright © 2019 escarmoosh. All rights reserved.
//

import Foundation

class CardFakker: CardStoreProtocol {
    
    func fetchCard(with id: String, completionHandler: @escaping ((CardModel?, Error?) -> Void))
    {
        do {
            let card = try self.createFakeCard(_id: id, firstName: "Arnaud", lastName: "Verrier", club: "Bondy", birthday: "1984-12-20", category: "Senior", hand: "Droite", weapon: "Epee", grip: "Crosse", score: 3.4)
            completionHandler(card, nil)
        } catch let error as CardStoreError {
            
            completionHandler(nil, error);
        } catch {
            
            completionHandler(nil, CardStoreError.UnkownError)
        }
    }
    
    func fetchCards(completionHandler: @escaping (([CardModel]?, Error?) -> Void))
    {
        var card: [CardModel] = Array()
        
        do {
            try card.append(self.createFakeCard(_id: "0", firstName: "Arnaud", lastName: "Verrier", club: "Bondy", birthday: "1984-12-20", category: "Senior", hand: "Droite", weapon: "Epee", grip: "Crosse", score: 3.4))
            try card.append(self.createFakeCard(_id: "1", firstName: "Arnaud", lastName: "Verrier", club: "Bondy", birthday: "1984-12-20", category: "Senior", hand: "Droite", weapon: "Epee", grip: "Crosse", score: 3.8))
            try card.append(self.createFakeCard(_id: "2", firstName: "Arnaud", lastName: "Verrier", club: "Bondy", birthday: "1984-12-20", category: "Senior", hand: "Droite", weapon: "Epee", grip: "Crosse", score: 3.1))
            try card.append(self.createFakeCard(_id: "3", firstName: "Arnaud", lastName: "Verrier", club: "Bondy", birthday: "1984-12-20", category: "Senior", hand: "Droite", weapon: "Epee", grip: "Crosse", score: 2))
            try card.append(self.createFakeCard(_id: "4", firstName: "Arnaud", lastName: "Verrier", club: "Bondy", birthday: "1984-12-20", category: "Senior", hand: "Droite", weapon: "Epee", grip: "Crosse", score: 4.4))
            
            completionHandler(card, nil)
        } catch let error as CardStoreError {
            
            completionHandler(nil, error);
        } catch {
            
            completionHandler(nil, CardStoreError.UnkownError)
        }
    }
    
    func createFakeCard(_id: String, firstName: String, lastName: String, club: String, birthday: String, category: String, hand: String, weapon: String, grip: String, score: Double) throws -> CardModel
    {
        let formatter = Configuration.dateFormatter;
        guard let bDayDate = formatter.date(from: birthday) else {
            
            throw CardStoreError.createCardError(localizedDescription: NSLocalizedString("date_format", comment: "BDay date use bad format"))
        }
        
        let card1 = CardModel(_id: "0", firstName: "Arnaud", lastName: "Verrier", club: "Bondy", birthday: bDayDate, category: "Senior", hand: "Droite", weapon: "Epee", grip: "Crosse", score: score, competences: self.createFakeCompetences())
        return card1
    }
    
    private func createFakeCompetences() -> [CompetenceModel]
    {
        // physicality
        let stamina = self.createSkill(id: 0, label: "stamina", nBattle: self.randomNumberOfBattle())
        let explosivity = self.createSkill(id: 1, label: "explosivity", nBattle: self.randomNumberOfBattle())
        let pace = self.createSkill(id: 2, label: "pace", nBattle: self.randomNumberOfBattle())
        
        let physicality = CompetenceModel(_id: "0", label: "physicality", score: self.randomScore(), skills: [stamina, explosivity, pace])
        
        // mentality
        let combativity = self.createSkill(id: 3, label: "combativity", nBattle: self.randomNumberOfBattle())
        let control = self.createSkill(id: 4, label: "control", nBattle: self.randomNumberOfBattle())

        let mentality = CompetenceModel(_id: "1", label: "mentality", score: self.randomScore(), skills: [combativity, control])
        
        // technicality
        let offense = self.createSkill(id: 5, label: "offense", nBattle: self.randomNumberOfBattle())
        let footwork = self.createSkill(id: 6, label: "footwork", nBattle: self.randomNumberOfBattle())
        let accuracy = self.createSkill(id: 7, label: "accuracy", nBattle: self.randomNumberOfBattle())
        let movement = self.createSkill(id: 8, label: "positioning", nBattle: self.randomNumberOfBattle())
        
        let technicality = CompetenceModel(_id: "2", label: "technicality", score: self.randomScore(), skills: [offense, footwork, accuracy, movement])
        
        // strategically
        let selfcontrol = self.createSkill(id: 9, label: "selfcontrol", nBattle: self.randomNumberOfBattle())
        let goalkeeper = self.createSkill(id: 10, label: "goalkeeper", nBattle: self.randomNumberOfBattle())
        let positionkeeper = self.createSkill(id: 11, label: "positionkeeper", nBattle: self.randomNumberOfBattle())
        
        let strategically = CompetenceModel(_id: "3", label: "strategically", score: self.randomScore(), skills: [selfcontrol, goalkeeper, positionkeeper])
        
        return [physicality, mentality, technicality, strategically]
    }
    
    private func createSkill(id: Int, label: String, nBattle: Int) -> SkillModel {
        
        return SkillModel(_id: String(id), label: label, win: self.randomNumberOfWin(nBattle: nBattle), total: nBattle, value: id)
    }
    
    private func randomScore(scoreMax:Double? = 5.0) -> Double {
    
        return Double.random(in: 1 ... scoreMax!)
    }
    
    private func randomNumberOfBattle() -> Int {
        
        return Int.random(in: 1 ... 100)
    }
    
    private func randomNumberOfWin(nBattle: Int) -> Int {
        
        return Int.random(in: 0 ... nBattle)
    }
}
