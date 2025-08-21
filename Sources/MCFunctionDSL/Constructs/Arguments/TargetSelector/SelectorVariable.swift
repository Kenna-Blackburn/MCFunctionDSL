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
        
        var argumentBody: some Argument {
            switch self {
            case .nearestPlayer:
                "@p"
            case .random:
                "@r"
            case .allPlayers:
                "@a"
            case .allEntities:
                "@e"
            case .executor:
                "@s"
            case .player(let name):
                name
            }
        }
    }
}
