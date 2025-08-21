//
//  Argument.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/17/25.
//

import Foundation

protocol Argument {
    associatedtype ArgumentBody: Argument
    
    typealias Padding = (leading: Bool, trailing: Bool)
    
    var padding: Padding { get }
    
    var argumentBody: ArgumentBody { get }
    
    func compileArgument() -> String
}

extension Argument {
    var padding: Padding { (true, true) }
    
    func compileArgument() -> String {
        return argumentBody.compileArgument()
    }
}

extension Never: Argument {
    var argumentBody: Never { fatalError() }
    func compileArgument() -> String { fatalError() }
}
