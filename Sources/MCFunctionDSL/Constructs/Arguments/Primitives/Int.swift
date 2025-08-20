//
//  Int.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

extension Int: Argument {
    func compileArgument() -> String {
        return String(self)
    }
}

extension UInt: Argument {
    func compileArgument() -> String {
        return String(self)
    }
}

extension UInt8: Argument {
    func compileArgument() -> String {
        return String(self)
    }
}
