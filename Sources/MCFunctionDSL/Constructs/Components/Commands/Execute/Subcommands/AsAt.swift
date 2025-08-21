//
//  AsAt.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

struct As: ExecuteSubcommand {
    let target: TargetSelector
    
    init(_ target: TargetSelector) {
        self.target = target
    }
    
    var argumentBody: some Argument {
        ArgumentGroup("as", target)
    }
}

struct At: ExecuteSubcommand {
    let target: TargetSelector
    
    init(_ target: TargetSelector) {
        self.target = target
    }
    
    var argumentBody: some Argument {
        ArgumentGroup("at", target)
    }
}
