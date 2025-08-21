//
//  Command.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/17/25.
//

import Foundation

typealias Command = ArgumentGroup
extension Command: MCComponent {
    var body: Never { fatalError() }
    
    func compileLines() -> [String] {
        return [compileArgument()]
    }
}

extension Command {
    var isExecutable: Bool {
        return self
            .compileArgument()
            .matches(of: /^(?:\s*#+.+|\s*)$/)
            .isEmpty
    }
}
