//
//  Argument.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/17/25.
//

import Foundation

protocol Argument {
    func compileArgument() -> String
}

extension String: Argument {
    func compileArgument() -> String {
        return self
    }
}

extension Int: Argument {
    func compileArgument() -> String {
        return String(format: "%g", self)
    }
}

extension Double: Argument {
    func compileArgument() -> String {
        return String(format: "%g", self)
    }
}
