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
    
    var argumentBody: some Argument { " " }
}

// TODO: replace fully with .unpadding*
struct _Unpadding: Argument, MCComponent {
    let argument: any Argument
    let padding: Padding = (false, false)
    
    init(_ argument: any Argument) {
        self.argument = argument
    }
    
    var argumentBody: Never { fatalError() }
    
    func compileArgument() -> String {
        let anyArgument = _AnyArgument(
            padding: (false, false),
            compileArgument: { argument.compileArgument() }
        )
        
        return anyArgument.compileArgument()
    }
    
    var componentBody: some MCComponent {
        Command(compileArgument())
    }
}
