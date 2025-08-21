//
//  AnyArgument.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

struct _AnyArgument: Argument {
    let padding: Padding
    
    let _compileArgument: () -> String
    
    init(
        padding: Padding = (true, true),
        compileArgument: @escaping () -> String
    ) {
        self.padding = padding
        self._compileArgument = compileArgument
    }
    
    var argumentBody: Never { fatalError() }
    
    func compileArgument() -> String { return _compileArgument() }
    
    init(
        _ argument: any Argument,
        padding: Padding = (true, true)
    ) {
        self.init(
            padding: padding,
            compileArgument: { argument.compileArgument() }
        )
    }
}
