//
//  MCFunction.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/17/25.
//

import Foundation

typealias MCFunction = MCComponent
extension MCFunction {
    func compileContents() -> String {
        return self
            .compileLines()
            .joined(separator: "\n")
    }
    
    func save(to url: URL) throws {
        let contents = compileContents()
        try contents.write(to: url, atomically: true, encoding: .utf8)
    }
}
