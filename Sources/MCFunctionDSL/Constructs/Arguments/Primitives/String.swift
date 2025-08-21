//
//  String.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

extension String: Argument {
    var argumentBody: Never { fatalError() }
    
    func compileArgument() -> String {
        return self
    }
}
