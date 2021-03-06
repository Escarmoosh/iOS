//
//  DisplayCardModels.swift
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

enum DisplayCard
{
    // MARK: Use cases
    
    enum Skill
    {
        struct ViewModel
        {
            var label: String
            var win: Int
            var total: Int
            var percentLabel: String
            var scoreLabel: String
        }
    }
    
    enum Competence
    {
        struct ViewModel
        {
            
            var label: String
            var score: Double
            
            var skills: [DisplayCard.Skill.ViewModel]
        }
    }
    
    enum Information
    {
        struct Request
        {
            var id: String
        }
        struct Response
        {
            var card:CardModel
        }
        struct ViewModel
        {
            var completeName: String
            var completeLocation: String
            var completeCategory: String
            var completeWeapon: String
            
            var score: Double
            
            var competences: [DisplayCard.Competence.ViewModel]
        }
    }
}

