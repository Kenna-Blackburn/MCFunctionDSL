//
//  ArgumentGroup.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/17/25.
//

import Foundation

struct ArgumentGroup: Argument {
    let children: [(any Argument)?]
    
    init(children: [(any Argument)?]) {
        self.children = children
    }
    
    var argumentBody: Never { fatalError() }
    
    func compileArgument() -> String {
        let compactedChildren = children
            .compactMap({ $0 })
        
        let compilation = compactedChildren
            .enumerated()
            .reduce(into: [any Argument]()) { (result, enumeratedChild) in
                let (i, child) = enumeratedChild
                
                if child.padding.leading,
                   !(result.last is _Padding),
                   i > 0
                {
                    result.append(_Padding())
                }
                
                result.append(child.compileArgument())
                
                if child.padding.trailing,
                   i < compactedChildren.count - 1
                {
                    result.append(_Padding())
                }
            }
            .map({ $0.compileArgument() })
            .joined()
        
        return compilation
    }
}

extension ArgumentGroup {
    static var empty: Self { .init(children: []) }
    
    init(
        _ children: (any Argument)?...,
        prepare: (inout [(any Argument)?]) -> Void = { _ in }
    ) {
        var children = children
        prepare(&children)
        self.init(children: children)
    }
}
