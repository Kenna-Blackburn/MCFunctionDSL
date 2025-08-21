//
//  Effect.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

enum Effect: MCComponent {
    case _give(target: TargetSelector, effect: Self.Effect, hideParticles: Bool?)
    case _clear(target: TargetSelector)
    
    var body: some MCComponent {
        switch self {
        case ._give(let target, let effect, let hideParticles):
            Command(
                "effect",
                target,
                effect.effectID,
                effect.duration,
                effect.strength,
                hideParticles
            )
        case ._clear(let target):
            Command(
                "effect",
                target,
                "clear"
            )
        }
    }
    
    init(
        give target: TargetSelector,
        _ effect: Self.Effect,
        hideParticles: Bool? = nil
    ) {
        self = ._give(
            target: target,
            effect: effect,
            hideParticles: hideParticles
        )
    }
    
    init(clear target: TargetSelector) {
        self = ._clear(target: target)
    }
}

extension Effect {
    struct Effect {
        let effectID: String
        let strength: UInt8
        let duration: Self.Duration
        
        init(
            _ effectID: String,
            _ strength: UInt8,
            for duration: Self.Duration
        ) {
            self.effectID = effectID
            self.strength = strength
            self.duration = duration
        }
    }
}

extension Effect.Effect {
    enum Duration: Argument {
        case duration(Int)
        case infinite
        
        func compileArgument() -> String {
            switch self {
            case .duration(let duration):
                return duration.compileArgument()
            case .infinite:
                return "infinite"
            }
        }
    }
}

extension Effect.Effect.Duration: ExpressibleByIntegerLiteral {
    init(integerLiteral value: IntegerLiteralType) {
        self = .duration(value)
    }
}

extension Effect.Effect {
    static func invisibility(
        _ strength: UInt8,
        for duration: Effect.Effect.Duration
    ) -> Self {
        return .init("invisibility", strength, for: duration)
    }
    
    static func levitation(
        _ strength: UInt8,
        for duration: Effect.Effect.Duration
    ) -> Self {
        return .init("levitation", strength, for: duration)
    }
    
    static func speed(
        _ strength: UInt8,
        for duration: Effect.Effect.Duration
    ) -> Self {
        return .init("speed", strength, for: duration)
    }
    
    static func jumpBoost(
        _ strength: UInt8,
        for duration: Effect.Effect.Duration
    ) -> Self {
        return .init("jump_boost", strength, for: duration)
    }
}
