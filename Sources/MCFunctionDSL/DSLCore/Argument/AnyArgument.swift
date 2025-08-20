//
//  AnyArgument.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

struct _AnyArgument: Argument {
    var padding: Padding
    
    let _compileArgument: () -> String
    
    func compileArgument() -> String { return _compileArgument() }
    
    init(
        padding: Padding = (true, true),
        compileArgument: @escaping () -> String
    ) {
        self.padding = padding
        self._compileArgument = compileArgument
    }
}
