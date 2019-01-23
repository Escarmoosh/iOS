//
//  DisplayCardPresenter.swift
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

protocol DisplayCardPresentationLogic
{
    func presentInformation(response: DisplayCard.Information.Response)
}

class DisplayCardPresenter: DisplayCardPresentationLogic
{
    weak var viewController: DisplayCardDisplayLogic?
    
    // MARK: Do something
    
    func presentInformation(response: DisplayCard.Information.Response)
    {
        viewController?.displayInformation(viewModel: self.presentCardInformation(response: response))
        viewController?.displayCompetences(viewModel: self.presentCardInformation(response: response))
    }
    
    private func presentCardInformation(response: DisplayCard.Information.Response) -> DisplayCard.Information.ViewModel {
        
        let completeName = response.card.firstName + " " + response.card.lastName
        let completeLocation = response.card.club
        let completeCategory = response.card.weapon + " - " + response.card.category
        let completeWeapon = response.card.hand + " - " + response.card.grip
        
        let informationViewModel = DisplayCard.Information.ViewModel(completeName: completeName, completeLocation: completeLocation, completeCategory: completeCategory, completeWeapon: completeWeapon, score: response.card.score, competences: self.presentCardCompetences(response: response))
        
        return informationViewModel
    }
    
    private func presentCardCompetences(response: DisplayCard.Information.Response) -> [DisplayCard.Competence.ViewModel] {
        
        var competences: [DisplayCard.Competence.ViewModel] = []
        for competence: CompetenceModel in response.card.competences {
            
            competences.append(self.presentCardCompetence(competence: competence))
        }
        
        return competences;
    }
    
    private func presentCardCompetence(competence: CompetenceModel) -> DisplayCard.Competence.ViewModel {
        
        let competenceViewModel = DisplayCard.Competence.ViewModel(label: competence.label, score: competence.score, skills: self.presentCardSkills(competence: competence))
        return competenceViewModel
    }
    
    private func presentCardSkills(competence: CompetenceModel) -> [DisplayCard.Skill.ViewModel] {
        
        var skills: [DisplayCard.Skill.ViewModel] = []
        for skill: SkillModel in competence.skills {
            
            skills.append(self.presentCardSkill(skill: skill))
        }
        
        return skills;
    }
    
    private func presentCardSkill(skill: SkillModel) -> DisplayCard.Skill.ViewModel {
        
        let skillViewModel = DisplayCard.Skill.ViewModel(label: skill.label, win: skill.win, total: skill.total, scoreLabel: String(skill.win) + "/" + String(skill.total))
        return skillViewModel
    }
}
