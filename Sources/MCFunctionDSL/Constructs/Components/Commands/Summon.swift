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
    let spawnEvent: SpawnEvent?
    
    init(
        _ entityType: EntityType,
        at position: Position? = nil,
        named name: String? = nil,
        spawnEvent: SpawnEvent? = nil
    ) {
        self.entityType = entityType
        self.position = position
        self.name = name
        self.spawnEvent = spawnEvent
    }
    
    var body: some MCComponent {
        Command(
            "summon",
            entityType,
            position,
            spawnEvent,
            name.quoted()
        )
    }
}
