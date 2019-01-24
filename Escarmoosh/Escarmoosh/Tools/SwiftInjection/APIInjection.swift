//
//  APIInjection.swift
//  Escarmoosh
//
//  Created by Arnaud Verrier on 24/01/2019.
//  Copyright © 2019 escarmoosh. All rights reserved.
//

import Foundation
import Swinject

class APIInjection {
    
    let container: Container = {
        
        let container = Container()
        container.register(CardStoreProtocol.self) { _ in CardFakker()}
        return container
    }()
}
