//
//  Padding.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

struct _Padding: Argument {
    init() {}
    
    let padding: Padding = (false, false)
    
    func compileArgument() -> String { return " " }
}

struct _Unpadding: Argument {
    let argument: any Argument
    
    init(_ argument: any Argument) {
        self.argument = argument
    }
    
    let padding: Padding = (false, false)
    
    func compileArgument() -> String {
        let anyArgument = _AnyArgument(
            padding: (false, false),
            compileArgument: { argument.compileArgument() }
        )
        
        return anyArgument.compileArgument()
    }
}

extension _ArgumentGroup {
    func unpadded() -> _ArgumentGroup {
        let newChildren = self
            .children
            .map { child in
                guard let child else { return _Unpadding?.none }
                return _Unpadding(child)
            }
        
        return _ArgumentGroup(children: newChildren)
    }
}
