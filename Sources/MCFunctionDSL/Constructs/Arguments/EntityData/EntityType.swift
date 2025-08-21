//
//  EntityType.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

struct EntityType: Argument {
    let typeID: String
    let namespace: String
    
    init(
        _ typeID: String,
        namespace: String = "minecraft"
    ) {
        self.typeID = typeID
        self.namespace = namespace
    }
    
    func compileArgument() -> String {
        return "\(namespace):\(typeID)"
    }
}

extension EntityType: ExpressibleByStringLiteral {
    init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}

extension EntityType {
    static let armorStand: Self = "armor_stand"
    static let snowball: Self = "snowball"
    static let arrow: Self = "arrow"
    static let item: Self = "item"
    static let tnt: Self = "tnt"
}
