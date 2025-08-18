//
//  File.swift
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
    
    var body: some MCComponent {
        Command("kill", target)
    }
}
