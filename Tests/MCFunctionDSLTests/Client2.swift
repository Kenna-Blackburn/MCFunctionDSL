//
//  Client2.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/21/25.
//

import Testing
import Foundation
@testable import MCFunctionDSL

@Test("Client 2")
func client2() async throws {
    struct SpiritsTickMCFunction: MCFunction {
        var componentBody: some MCComponent {
            Spirit(
                name: "Speed Spirit",
                effect: .speed(3, for: 1),
                spawnEntityType: "allay",
                speed: 0.2,
                movementRange: 5...30,
                effectRange: 10
            )
            
            Spirit(
                name: "Bounce Spirit",
                effect: .jumpBoost(5, for: 5),
                spawnEntityType: "slime",
                speed: 0.15,
                movementRange: 3...25,
                effectRange: 7
            )
        }
        
        struct Spirit: MCComponent {
            let name: String
            let effect: Effect.Effect
            let spawnEntityType: EntityType
            let speed: Double
            let movementRange: ClosedRange<Double>
            let effectRange: Double
            
            var componentBody: some MCComponent {
                Section("Spirit: \(name)") {
                    Section("Set Up") {
                        let spawnTarget = TargetSelector.allEntities(.named(name), .typed(spawnEntityType))
                        
                        Execute(.at(spawnTarget)) {
                            Summon(.armorStand, named: name)
                        }
                        
                        
                        Kill(spawnTarget)
                    }
                    
                    Section("Upkeep") {
                        let spirit = TargetSelector.allEntities(.named(name), .typed(.armorStand))
                        
                        Effect(
                            give: .invisibility(1, for: 1),
                            to: spirit,
                            hideParticles: true
                        )
                        
                        Teleport(
                            spirit,
                            to: .position(.forward(speed)),
                            facing: .target(
                                .nearestPlayer(
                                    .outside(radius: movementRange.lowerBound),
                                    .inside(radius: movementRange.upperBound)
                                )
                            )
                        )
                        
                        Execute(.at(spirit)) {
                            Effect(give: effect, to: .nearestPlayer(.inside(radius: effectRange)))
                        }
                    }
                }
            }
        }
    }
    
    print(SpiritsTickMCFunction().compileContents())
}
