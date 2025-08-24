//
//  Position.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/21/25.
//

import Foundation

// Teleport(.executor, .world(1, 2, 3))
// Teleport(.executor, .relative(1, 2, 3))
// Teleport(.executor, .relativeToRotation(1, 2, 3))

// Teleport(.executor, .init(.world(1), .relative, .world(1)))

enum Position: Argument, Equatable {
    case worldPosition(WorldPosition, WorldPosition, WorldPosition)
    case relativeToRotation(Double?, Double?, Double?)
    
    var argumentBody: some Argument {
        switch self {
        case .worldPosition(let x, let y, let z):
            ArgumentGroup(x, y, z)
        case .relativeToRotation(let x, let y, let z):
            ArgumentGroup { group in
                group.append(ArgumentGroup("^", x).unpaddingChildren())
                group.append(ArgumentGroup("^", y).unpaddingChildren())
                group.append(ArgumentGroup("^", z).unpaddingChildren())
            }
        }
    }
    
    init(
        _ x: WorldPosition,
        _ y: WorldPosition,
        _ z: WorldPosition,
    ) {
        self = .worldPosition(x, y, z)
    }
    
    static func world(
        _ x: Double,
        _ y: Double,
        _ z: Double,
    ) -> Self {
        return .worldPosition(
            .world(x),
            .world(y),
            .world(z),
        )
    }
    
    static func relative(
        _ x: Double?,
        _ y: Double?,
        _ z: Double?,
    ) -> Self {
        return .worldPosition(
            .relative(x),
            .relative(y),
            .relative(z),
        )
    }
}

extension Position {
    static let here: Self = .relative(nil, nil, nil)
    
    static func forward(_ z: Double?) -> Self {
        return .relativeToRotation(nil, nil, z)
    }
}
