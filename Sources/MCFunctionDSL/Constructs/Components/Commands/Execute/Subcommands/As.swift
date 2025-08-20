//
//  As.swift
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
    
    func compileArgument() -> String {
        return ArgumentGroup("as", target).compileArgument()
    }
}

struct At: ExecuteSubcommand {
    let target: TargetSelector
    
    init(_ target: TargetSelector) {
        self.target = target
    }
    
    func compileArgument() -> String {
        return ArgumentGroup("at", target).compileArgument()
    }
}
