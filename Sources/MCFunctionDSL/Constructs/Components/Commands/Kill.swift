//
//  Kill.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/18/25.
//

import Foundation

struct Kill: MCComponent {
    let target: TargetSelector?
    
    init(_ target: TargetSelector? = nil) {
        self.target = target
    }
    
    var componentBody: some MCComponent {
        Command("kill", target)
    }
}
