//
//  Argument.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/17/25.
//

import Foundation

protocol Argument {
    typealias Padding = (leading: Bool, trailing: Bool)
    
    var padding: Padding { get }
    
    func compileArgument() -> String
}

extension Argument {
    var padding: Padding { (true, true) }
}
