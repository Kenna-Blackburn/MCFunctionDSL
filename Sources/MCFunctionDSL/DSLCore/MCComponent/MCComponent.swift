//
//  MCComponent.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/17/25.
//

import Foundation

protocol MCComponent {
    associatedtype ComponentBody: MCComponent
    
    @MCComponentBuilder
    var componentBody: ComponentBody { get }
    
    func compileLines() -> [String]
}

extension MCComponent {
    var isExecutable: Bool { true }
    
    func compileLines() -> [String] {
        return componentBody.compileLines()
    }
}

extension Never: MCComponent {
    var componentBody: Never { fatalError() }
    func compileLines() -> [String] { fatalError() }
}
