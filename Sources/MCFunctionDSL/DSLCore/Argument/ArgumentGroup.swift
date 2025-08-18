//
//  ArgumentGroup.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/17/25.
//

import Foundation

struct _ArgumentGroup: Argument {
    let children: [(any Argument)?]
    
    init(children: [(any Argument)?]) {
        self.children = children
    }
    
    func compileArgument() -> String {
        return children
            .compactMap({ $0?.compileArgument() })
            .joined(separator: " ")
    }
}

extension _ArgumentGroup {
    static var empty: Self { .init(children: []) }
    
    init(_ children: (any Argument)?...) {
        self.init(children: children)
    }
}
