//
//  EntityType.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

struct EntityType: Argument, ExpressibleByStringLiteral {
    let typeID: String
    let namespace: String
    
    init(
        _ typeID: String,
        namespace: String = "minecraft"
    ) {
        self.typeID = typeID
        self.namespace = namespace
    }
    
    init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
    
    func compileArgument() -> String {
        return "\(namespace):\(typeID)"
    }
}

extension EntityType {
    static let armorStand: Self = "armor_stand"
    static let snowball: Self = "snowball"
    static let arrow: Self = "arrow"
    static let tnt: Self = "tnt"
}
