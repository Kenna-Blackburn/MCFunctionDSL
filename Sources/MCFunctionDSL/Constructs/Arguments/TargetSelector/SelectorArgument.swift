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
        
        var argumentBody: some Argument {
            ArgumentGroup(
                argument,
                "=",
                invert ? "!" : nil,
                value
            )
            .unpaddingChildren()
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
            value: name.quoted(),
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
    
    static func tagged(_ tag: EntityTag, invert: Bool = false) -> Self {
        return .init(
            "tag",
            value: tag,
            invert: invert
        )
    }
}

extension TargetSelector.SelectorArgument {
    static func within(radius: Double) -> Self {
        return .init("r", value: radius)
    }
    
    static func outside(radius: Double) -> Self {
        return .init("rm", value: radius)
    }
}
