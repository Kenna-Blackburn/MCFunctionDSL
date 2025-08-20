//
//  Effect.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

enum Effect: MCComponent {
    case give(target: TargetSelector, effect: Self.Effect, hideParticles: Bool)
    case clear(target: TargetSelector)
    
    var body: some MCComponent {
        switch self {
        case .give(let target, let effect, let hideParticles):
            Command("effect", target, effect.effectID, effect.duration, effect.strength, hideParticles)
        case .clear(let target):
            Command("effect", target, "clear")
        }
    }
    
    static func give(
        _ target: TargetSelector,
        _ effect: Self.Effect,
        hideParticles: Bool = false
    ) -> Self {
        return .give(target: target, effect: effect, hideParticles: hideParticles)
    }
    
    static func clear(_ target: TargetSelector) -> Self {
        return .clear(target: target)
    }
}

extension Effect {
    struct Effect {
        var effectID: String
        var strength: UInt8
        var duration: Self.Duration
        
        init(
            _ effectID: String,
            strength: UInt8,
            duration: Self.Duration
        ) {
            self.effectID = effectID
            self.strength = strength
            self.duration = duration
        }
    }
}

extension Effect.Effect {
    enum Duration: Argument, ExpressibleByIntegerLiteral {
        case duration(Int)
        case infinite
        
        init(integerLiteral value: IntegerLiteralType) {
            self = .duration(value)
        }
        
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

extension Effect.Effect {
    static func invisibility(
        _ strength: UInt8,
        for duration: Effect.Effect.Duration
    ) -> Self {
        return .init(
            "invisibility",
            strength: strength,
            duration: duration
        )
    }
    
    static func levitation(
        _ strength: UInt8,
        for duration: Effect.Effect.Duration
    ) -> Self {
        return .init(
            "levitation",
            strength: strength,
            duration: duration
        )
    }
    
    static func speed(
        _ strength: UInt8,
        for duration: Effect.Effect.Duration
    ) -> Self {
        return .init(
            "speed",
            strength: strength,
            duration: duration
        )
    }
    
    static func jumpBoost(
        _ strength: UInt8,
        for duration: Effect.Effect.Duration
    ) -> Self {
        return .init(
            "jump_boost",
            strength: strength,
            duration: duration
        )
    }
}
