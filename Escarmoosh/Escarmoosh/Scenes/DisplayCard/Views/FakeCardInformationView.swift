//
//  FakeCardInformationView.swift
//  Escarmoosh
//
//  Created by Arnaud Verrier on 21/01/2019.
//  Copyright © 2019 escarmoosh. All rights reserved.
//

import UIKit

class FakeCardInformationView: GeneriqueCardInformationView {
    
    @IBOutlet var labelTest: UILabel!
    
    override func getNibName() -> String? {
        return "FakeCardInformationView"
    }
    
    override func display(viewModel: DisplayCard.Information.ViewModel) {
        
        labelTest.text = viewModel.completeName
    }
}
