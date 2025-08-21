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

enum Position: Argument {
    case _worldPosition(x: WorldPosition, y: WorldPosition, z: WorldPosition)
    case _relativeToRotation(x: Double?, y: Double?, z: Double?)
    
    func compileArgument() -> String {
        switch self {
        case ._worldPosition(let x, let y, let z):
            return ArgumentGroup(x, y, z).compileArgument()
        case ._relativeToRotation(let x, let y, let z):
            return ArgumentGroup { group in
                group.append(ArgumentGroup("^", x).unpaddingChildren())
                group.append(ArgumentGroup("^", y).unpaddingChildren())
                group.append(ArgumentGroup("^", z).unpaddingChildren())
            }
            .compileArgument()
        }
    }
    
    init(
        _ x: WorldPosition,
        _ y: WorldPosition,
        _ z: WorldPosition,
    ) {
        self = ._worldPosition(x: x, y: y, z: z)
    }
    
    static func world(
        _ x: Double,
        _ y: Double,
        _ z: Double,
    ) -> Self {
        return ._worldPosition(
            x: .world(x),
            y: .world(y),
            z: .world(z),
        )
    }
    
    static func relative(
        _ x: Double?,
        _ y: Double?,
        _ z: Double?,
    ) -> Self {
        return ._worldPosition(
            x: .relative(x),
            y: .relative(y),
            z: .relative(z),
        )
    }
    
    static func relativeToRotation(
        _ x: Double?,
        _ y: Double?,
        _ z: Double?,
    ) -> Self {
        return ._relativeToRotation(x: x, y: y, z: z)
    }
}

extension Position {
    static let here: Self = .relative(nil, nil, nil)
    
    static func forward(_ z: Double?) -> Self {
        return .relativeToRotation(nil, nil, z)
    }
}
