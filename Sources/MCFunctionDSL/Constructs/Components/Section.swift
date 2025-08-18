//
//  Section.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/17/25.
//

import Foundation

struct Section<Content: MCComponent>: MCComponent {
    let header: String
    let level: Int
    let content: () -> Content
    
    init(
        _ header: String,
        level: Int = 1,
        @MCComponentBuilder content: @escaping () -> Content
    ) {
        self.header = header
        self.level = level
        self.content = content
    }
    
    var body: some MCComponent {
        Comment(header, level: level)
        content().indenting(by: level)
    }
}
