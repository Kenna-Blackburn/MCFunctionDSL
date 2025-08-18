//
//  Command.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/17/25.
//

import Foundation

typealias Command = _ArgumentGroup
extension Command: MCComponent {
    var body: Never { fatalError() }
    
    func compileLines() -> [String] {
        return [compileArgument()]
    }
}
