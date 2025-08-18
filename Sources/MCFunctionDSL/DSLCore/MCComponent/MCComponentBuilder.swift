//
//  MCComponentBuilder.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/17/25.
//

import Foundation

@resultBuilder
struct MCComponentBuilder {
    private init() {}
    
    static func buildBlock(_ components: (any MCComponent)...) -> _MCComponentGroup { return .init(children: components) }
    static func buildBlock() -> _MCComponentGroup { return .empty }
    static func buildBlock(_ components: Never) -> Never {}
    
    static func buildOptional(_ component: (any MCComponent)?) -> _MCComponentGroup {
        guard let component else { return .empty }
        return .init(component)
    }
    
    static func buildEither(first component: any MCComponent) -> _MCComponentGroup { return .init(component) }
    static func buildEither(second component: any MCComponent) -> _MCComponentGroup { return .init(component) }
    
    static func buildArray(_ components: [any MCComponent]) -> _MCComponentGroup { return .init(children: components) }
}
