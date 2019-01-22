//
//  FakeCardInformationView.swift
//  Escarmoosh
//
//  Created by Arnaud Verrier on 21/01/2019.
//  Copyright © 2019 escarmoosh. All rights reserved.
//

import UIKit

class FakeCardInformationView: GeneriqueCardInformationView {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    
    @IBOutlet weak var labelWeapon: UILabel!
    
    @IBOutlet weak var viewForScore: GeneriqueCompetenceScoreView!
    
    override func getNibName() -> String? {
        return "FakeCardInformationView"
    }
    
    override func display(viewModel: DisplayCard.Information.ViewModel) {
        
        labelName.text = viewModel.completeName
        labelLocation.text = viewModel.completeLocation
        labelWeapon.text = viewModel.completeWeapon
        labelCategory.text = viewModel.completeCategory
        
        viewForScore.display(viewModel: viewModel)
    }
}
