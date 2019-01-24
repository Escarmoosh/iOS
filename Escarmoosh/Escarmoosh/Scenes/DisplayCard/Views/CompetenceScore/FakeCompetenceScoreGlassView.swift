//
//  FakeCompetenceScoreGlassView.swift
//  Escarmoosh
//
//  Created by Arnaud Verrier on 22/01/2019.
//  Copyright © 2019 escarmoosh. All rights reserved.
//

import UIKit

@IBDesignable
class FakeCompetenceScoreGlassView: GeneriqueCompetenceScoreView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }
    
    @IBOutlet weak var cstrWidthForScore: NSLayoutConstraint!
    
    override func display(viewModel: DisplayCard.Information.ViewModel) {
        
        cstrWidthForScore.setMultiplier(multiplier: CGFloat(viewModel.score/5.0))
    }
    
    override func display(viewModel: DisplayCard.Competence.ViewModel) {
        
        cstrWidthForScore.setMultiplier(multiplier: CGFloat(viewModel.score/5.0))
    }
}
