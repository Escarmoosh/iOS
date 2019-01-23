//
//  FakeSkillScoreView.swift
//  Escarmoosh
//
//  Created by Arnaud Verrier on 23/01/2019.
//  Copyright © 2019 escarmoosh. All rights reserved.
//

import UIKit

class FakeSkillScoreView: GeneriqueSkillScoreView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cstrForScore: NSLayoutConstraint!
    @IBOutlet weak var scoreLabel: UILabel!
    override func getNibName() -> String? {
        return "FakeSkillScoreView"
    }
    
    override func display(viewModel: DisplayCard.Skill.ViewModel) {
        
        nameLabel.text = viewModel.label
        scoreLabel.text = viewModel.scoreLabel
        cstrForScore.setMultiplier(multiplier: CGFloat(viewModel.win)/CGFloat(viewModel.total))
    }
}
