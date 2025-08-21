//
//  Summon.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/21/25.
//

import Foundation

struct Summon: MCComponent {
    let entityType: EntityType
    let position: Position?
    let name: String?
    
    init(
        _ entityType: EntityType,
        at position: Position? = nil,
        named name: String? = nil
    ) {
        self.entityType = entityType
        self.position = position
        self.name = name
    }
    
    var body: some MCComponent {
        Command(
            "summon",
            entityType,
            position,
            name.quoted()
        )
    }
}
