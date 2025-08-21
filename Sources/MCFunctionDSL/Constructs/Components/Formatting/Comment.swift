//
//  Comment.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/17/25.
//

import Foundation

struct Comment: MCComponent {
    var isExecutable: Bool = false
    
    let content: String
    let level: Int
    
    init(
        _ content: String,
        level: Int = 1
    ) {
        self.content = content
        self.level = level
    }
    
    var componentBody: some MCComponent {
        Command(String(repeating: "#", count: level), content)
    }
}
