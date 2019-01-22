//
//  MASKView.swift
//  Escarmoosh
//
//  Created by Arnaud Verrier on 22/01/2019.
//  Copyright © 2019 escarmoosh. All rights reserved.
//

import UIKit

@IBDesignable
class MASKView: UIView {
    
    var maskImageView = UIImageView()
    
    @IBInspectable
    var maskImage: UIImage? {
        didSet {
            maskImageView.image = maskImage
            updateView()
        }
    }
    
    // This updates mask size when changing device orientation (portrait/landscape)
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        if maskImageView.image != nil {
            maskImageView.frame = bounds
            mask = maskImageView
        }
    }
}
