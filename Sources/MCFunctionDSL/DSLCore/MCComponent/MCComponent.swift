//
//  MCComponent.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/17/25.
//

import Foundation

protocol MCComponent {
    associatedtype Body: MCComponent
    
    @MCComponentBuilder
    var body: Body { get }
    
    func compileLines() -> [String]
}

extension MCComponent {
    var isExecutable: Bool { true }
    
    func compileLines() -> [String] {
        return body.compileLines()
    }
}

extension Never: MCComponent {
    var body: Never { fatalError() }
}
