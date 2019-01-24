//
//  FakeSkillScorePercentView.swift
//  Escarmoosh
//
//  Created by Arnaud Verrier on 23/01/2019.
//  Copyright © 2019 escarmoosh. All rights reserved.
//

import UIKit

@IBDesignable
class FakeSkillScorePercentView: GeneriqueSkillScoreView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cstrForScore: NSLayoutConstraint!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func display(viewModel: DisplayCard.Skill.ViewModel) {
        
        nameLabel.text = viewModel.label
        scoreLabel.text = viewModel.percentLabel
        cstrForScore.setMultiplier(multiplier: CGFloat(viewModel.win)/CGFloat(viewModel.total))
    }
}
