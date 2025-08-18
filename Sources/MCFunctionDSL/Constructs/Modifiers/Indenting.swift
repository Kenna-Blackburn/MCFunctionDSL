//
//  Indenting.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/18/25.
//

import Foundation

extension MCComponent {
    func indenting(
        by level: Int = 1,
        with indent: String = " "
    ) -> some MCComponent {
        let children = self
            .compileLines()
            .map({ Command(String(repeating: indent, count: level) + $0) })
        
        return _MCComponentGroup(children: children)
    }
}
