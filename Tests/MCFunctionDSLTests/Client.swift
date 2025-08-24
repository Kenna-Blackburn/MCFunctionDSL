//
//  Client.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/17/25.
//

import Testing
import Foundation
@testable import MCFunctionDSL

@Test("Client")
func client() async throws {
    @MCComponentBuilder
    func build() -> some MCFunction {
        Section("Kill Some Stuff") {
            Kill()
            
            Kill(.executor)
            
            Kill(.player("No_Pen_3825"))
                .commenting("yes thats my minecraft username too", padding: (true, true))
            
            Kill(.allEntities(.named("remove_me"), ._not(.named("do_not_remove"))))
                .commenting("`.notNamed(_:)` coming soon")
        }
        
        Section("Argument Testing Hell") {
            ArgumentGroup("1", _Unpadding("2"), "3")
            ArgumentGroup("1", _Unpadding("2"), _Unpadding("3"), "4")
            
            LineBreak()
            
            ArgumentGroup("+1").indenting(by: 1)
            ArgumentGroup("+2").indenting(by: 2)
            ArgumentGroup("+3").indenting(by: 3)
        }
        
        Section("Effect") {
            Effect(give: .invisibility(1, for: 1), to: .allEntities(.named("hide")), hideParticles: true)
            Effect(clearFrom: .allEntities(.named("show")))
            
            LineBreak()
            
            for i in 1...10 as ClosedRange<UInt8> {
                Effect(give: .levitation(i, for: 1), to: .allEntities(.tagged("up_\(i)")), hideParticles: true)
            }
        }
        
        Section("If") {
            for bool in [false, true] {
                Section(bool.description) {
                    Comment("1.1").if(bool)
                    if bool { Comment("1.2") }
                    
                    Comment("2")
                        .if(bool, apply: { $0.indenting(with: "#indent#") })
                }
            }
        }
        
        Section("Spirit") {
            // setup
            let spawnedAllay = TargetSelector.allEntities(.typed("allay"), .named("Speed Spirit")) // EntityType: ExpressibleByStringLiteral
            Execute(.at(spawnedAllay), run: { Summon(.armorStand, named: "Speed Spirit") }) // Summon(/*...*/).execute(At(spawnAllay))
            Kill(spawnedAllay)
            
            // upkeep
            let spirit = TargetSelector.allEntities(.typed(.armorStand), .named("Speed Spirit"))
            Effect(give: .invisibility(1, for: 1), to: spirit)
            Teleport(spirit, to: .position(.forward(0.2)), facing: .target(.nearestPlayer(.outside(radius: 5), .inside(radius: 30))))
            Execute(.at(spirit), run: { Effect(give: .speed(3, for: 1), to: .allPlayers(.inside(radius: 10))) })
        }
        
        Section("Execute (not that bad, really)") {
            Execute(.as(.allPlayers)) {
                Command("say 1")
                
                Section("2 & 3") {
                    Command("say 2")
                    Command("say 3")
                }
            }
        }
        
        Section("Position") {
            let positions: [Position] = [
                .world(1, 2, 3),
                .world(0.1, 0.2, 0.3),
                .relative(1, 2, 3),
                .relative(0.1, 0.2, 0.3),
                .relativeToRotation(1, 2, 3),
                .relativeToRotation(0.1, 0.2, 0.3),
                .here,
                .forward(1),
                .forward(0.1),
                .relative(1, nil, 3),
                .relativeToRotation(1, nil, 3),
                .forward(nil),
                .init(1, nil, 3),
            ]
            
            for position in positions {
                Summon(.armorStand, at: position, named: "trailing arg")
            }
        }
        
        Section("Fill") {
            Fill(from: .here, to: .relative(10, 10, 10), with: .glass)
            Fill(from: .here, to: .here, with: .glass)
        }
    }
    
    print(build().compileContents())
}
