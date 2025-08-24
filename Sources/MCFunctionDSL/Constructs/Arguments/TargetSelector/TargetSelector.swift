//
//  TargetSelector.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/18/25.
//

import Foundation

struct TargetSelector: Argument {
    var variable: SelectorVariable
    var arguments: [SelectorArgument]
    
    init(
        _ variable: SelectorVariable,
        arguments: [SelectorArgument] = []
    ) {
        self.variable = variable
        self.arguments = arguments
    }
    
    
    var argumentBody: some Argument {
        if arguments.isEmpty {
            variable.erase()
        } else {
            ArgumentGroup(
                variable,
                "[",
                arguments
                    .map({ $0.compileArgument() })
                    .joined(separator: ","),
                "]"
            )
            .unpaddingChildren()
        }
    }
}

extension TargetSelector {
    static var nearestPlayer: Self {
        return .init(.nearestPlayer)
    }
    
    static var random: Self {
        return .init(.random)
    }
    
    static var allPlayers: Self {
        return .init(.allPlayers)
    }
    
    static var allEntities: Self {
        return .init(.allEntities)
    }
    
    static var executor: Self {
        return .init(.executor)
    }
    
    static func player(_ name: String) -> Self {
        return .init(.player(name))
    }
}

extension TargetSelector {
    static func nearestPlayer(_ arguments: SelectorArgument...) -> Self {
        return .init(.nearestPlayer, arguments: arguments)
    }
    
    static func random(_ arguments: SelectorArgument...) -> Self {
        return .init(.random, arguments: arguments)
    }
    
    static func allPlayers(_ arguments: SelectorArgument...) -> Self {
        return .init(.allPlayers, arguments: arguments)
    }
    
    static func allEntities(_ arguments: SelectorArgument...) -> Self {
        return .init(.allEntities, arguments: arguments)
    }
    
    static func executor(_ arguments: SelectorArgument...) -> Self {
        return .init(.executor, arguments: arguments)
    }
    
    static func player(
        _ name: String,
        arguments: SelectorArgument...
    ) -> Self {
        return .init(.player(name), arguments: arguments)
    }
}
