//
//  MCComponentGroup.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/17/25.
//

import Foundation

struct _MCComponentGroup: MCComponent {
    var children: [any MCComponent]
    
    init(children: [any MCComponent]) {
        self.children = children
    }
    
    var componentBody: Never { fatalError() }
    
    func compileLines() -> [String] {
        return children
            .flatMap({ $0.compileLines() })
    }
}

extension _MCComponentGroup {
    static var empty: Self { .init(children: []) }
    
    init(
        _ children: (any MCComponent)...,
        prepare: (inout [any MCComponent]) -> Void = { _ in }
    ) {
        var children = children
        prepare(&children)
        self.init(children: children)
    }
}
