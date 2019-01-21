//
//  DisplayCardPresenter.swift
//  Escarmoosh
//
//  Created by Arnaud Verrier on 21/01/2019.
//  Copyright (c) 2019 escarmoosh. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DisplayCardPresentationLogic
{
    func presentSomething(response: DisplayCard.Information.Response)
}

class DisplayCardPresenter: DisplayCardPresentationLogic
{
    weak var viewController: DisplayCardDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: DisplayCard.Information.Response)
    {
        let viewModel = DisplayCard.Information.ViewModel(completeName: response.card.firstName)
        viewController?.displaySomething(viewModel: viewModel)
    }
}
