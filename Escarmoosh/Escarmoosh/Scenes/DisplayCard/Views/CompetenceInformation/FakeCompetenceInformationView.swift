//
//  FakeCompetenceInformationView.swift
//  Escarmoosh
//
//  Created by Arnaud Verrier on 23/01/2019.
//  Copyright © 2019 escarmoosh. All rights reserved.
//

import UIKit

@IBDesignable
class FakeCompetenceInformationView: GeneriqueCompetenceInformationView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var scoreView: GeneriqueCompetenceScoreView!
    @IBOutlet weak var skillsView: UIStackView!
    
    override func display(viewModel: DisplayCard.Competence.ViewModel) {
        
        labelName.text = viewModel.label
        scoreView.display(viewModel: viewModel)
        
        for skill in viewModel.skills {
           
            let fakeSkillScoreView = FakeSkillScorePercentView.init(frame: CGRect.zero)
            fakeSkillScoreView.display(viewModel: skill)
            skillsView.addArrangedSubview(fakeSkillScoreView)
        }
    }
}
