//
//  SelectorArgument.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/18/25.
//

import Foundation

extension TargetSelector {
    struct SelectorArgument: Argument {
        let argument: String
        let value: any Argument
        let invert: Bool
        
        init(
            _ argument: String,
            value: any Argument,
            invert: Bool = false
        ) {
            self.argument = argument
            self.value = value
            self.invert = invert
        }
        
        func compileArgument() -> String {
            let argumentGroup = ArgumentGroup(
                argument,
                "=",
                invert ? "!" : nil,
                value
            )
            
            let unpaddedArgumentGroup = argumentGroup.unpaddingChildren()
            return unpaddedArgumentGroup.compileArgument()
        }
    }
}

extension TargetSelector.SelectorArgument {
    static func _not(_ argument: Self) -> Self {
        return .init(
            argument.argument,
            value: argument.value,
            invert: !argument.invert
        )
    }
}

extension TargetSelector.SelectorArgument {
    static func named(_ name: String, invert: Bool = false) -> Self {
        return .init(
            "name",
            value: "\"\(name)\"",
            invert: invert
        )
    }
    
    static func typed(_ type: EntityType, invert: Bool = false) -> Self {
        return .init(
            "type",
            value: type,
            invert: invert
        )
    }
}

extension TargetSelector.SelectorArgument {
    static func within(radius: UInt) -> Self {
        return .init("r", value: radius)
    }
    
    static func outside(radius: UInt) -> Self {
        return .init("rm", value: radius)
    }
}
