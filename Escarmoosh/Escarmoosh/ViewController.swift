//
//  ViewController.swift
//  Escarmoosh
//
//  Created by Arnaud Verrier on 18/01/2019.
//  Copyright © 2019 escarmoosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        CardAPI.cardGet(cardId: "0") { (card:Card?, error:Error?) in
            
            if let error = error {
                
                NSLog("Error from swagger : %@", error.localizedDescription);
            }
            
            if let card = card {
                
                NSLog("Answer from swagger : %@", card.firstName)
            }
        }
    }


}

