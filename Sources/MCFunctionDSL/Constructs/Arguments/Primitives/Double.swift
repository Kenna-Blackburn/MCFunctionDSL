//
//  Double.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

extension Double: Argument {
    func compileArgument() -> String {
        return .init(format: "%g", self)
    }
}

extension Float: Argument {
    func compileArgument() -> String {
        return .init(format: "%g", self)
    }
}
