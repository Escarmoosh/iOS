//
//  FakeCardInformationView.swift
//  Escarmoosh
//
//  Created by Arnaud Verrier on 21/01/2019.
//  Copyright © 2019 escarmoosh. All rights reserved.
//

import UIKit

@IBDesignable
class FakeCardInformationView: GeneriqueCardInformationView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    
    @IBOutlet weak var labelWeapon: UILabel!
    
    @IBOutlet weak var viewForScore: GeneriqueCompetenceScoreView!
    
    override func display(viewModel: DisplayCard.Information.ViewModel) {
        
        labelName.text = viewModel.completeName
        labelLocation.text = viewModel.completeLocation
        labelWeapon.text = viewModel.completeWeapon
        labelCategory.text = viewModel.completeCategory
        
        viewForScore.display(viewModel: viewModel)
    }
}
