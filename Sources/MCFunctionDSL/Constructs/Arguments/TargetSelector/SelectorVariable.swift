//
//  SelectorVariable.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/18/25.
//

import Foundation

extension TargetSelector {
    enum SelectorVariable: Argument, CaseIterable {
        case nearestPlayer
        case random
        case allPlayers
        case allEntities
        case executor
        case player(String)
        
        static let allCases: [Self] = [
            .nearestPlayer,
            .random,
            .allPlayers,
            .allEntities,
            .executor,
        ]
        
        func compileArgument() -> String {
            switch self {
            case .nearestPlayer:
                return "@p"
            case .random:
                return "@r"
            case .allPlayers:
                return "@a"
            case .allEntities:
                return "@e"
            case .executor:
                return "@s"
            case .player(let name):
                return name
            }
        }
    }
}
