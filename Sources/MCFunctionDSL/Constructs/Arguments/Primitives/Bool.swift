//
//  Bool.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

extension Bool: Argument {
    func compileArgument() -> String {
        switch self {
        case true:
            return "true"
        case false:
            return "false"
        }
    }
}
