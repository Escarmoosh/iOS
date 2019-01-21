//
//  NIBView.swift
//  Escarmoosh
//
//  Created by Arnaud Verrier on 21/01/2019.
//  Copyright © 2019 escarmoosh. All rights reserved.
//

import UIKit

class NIBView: UIView
{
    private var contentView: UIView!
    
    // 1
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    // 2
    func setup()
    {
        if let nibNameSafe = self.getNibName()
        {
            guard let nibViews = Bundle.main.loadNibNamed(nibNameSafe, owner: self, options: nil) else {
                
                return;
            }
            
            self.contentView = nibViews.first as? UIView
            self.contentView.frame = self.bounds
            self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            self.addSubview(contentView)
        }
    }
    
    // 3
    func getNibName() -> String?
    {
        return nil
    }
}
