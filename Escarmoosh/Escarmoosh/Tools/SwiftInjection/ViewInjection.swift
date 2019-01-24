//
//  ViewInjection.swift
//  Escarmoosh
//
//  Created by Arnaud Verrier on 24/01/2019.
//  Copyright © 2019 escarmoosh. All rights reserved.
//

import Foundation
import Swinject

class ViewInjection {
    
    let container: Container = {
        
        let container = Container()
        container.register(GeneriqueSkillScoreView.self) { _ in FakeSkillScorePercentView(frame: .zero)}
        return container
    }()
}
