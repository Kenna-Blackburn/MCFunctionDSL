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
            _ArgumentGroup("1", _Unpadding("2"), "3")
            _ArgumentGroup("1", _Unpadding("2"), _Unpadding("3"), "4")
            
            LineBreak()
            
            _ArgumentGroup("+1").indenting(by: 1)
            _ArgumentGroup("+2").indenting(by: 2)
            _ArgumentGroup("+3").indenting(by: 3)
        }
        
        Section("Effect") {
            Effect.give(.allEntities(.named("hide")), .invisibility(1, for: 1), hideParticles: true)
            Effect.clear(.allEntities(.named("show")))
            
            LineBreak()
            
            for i in 1...10 as ClosedRange<UInt8> {
                Effect.give(.allEntities(.named("up_\(i)")), .levitation(i, for: 1), hideParticles: true)
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
        
//        Section("Spirit") {
//            // setup
//            let spawnedAllay = TargetSelector.allEntities(.typed("allay"), .named("Speed Spirit")) // EntityType: ExpressibleByStringLiteral
//            Execute(At(spawnedAllay), Run(Summon(.armorStand, named: "Speed Spirit"))) // Summon(/*...*/).execute(.at(spawnSelector))
//            Kill(spawnedAllay)
//            
//            // upkeep
//            let spirit = TargetSelector.allEntities(.typed(.armorStand), .named("Speed Spirit"))
//            Effect.give(spirit, .invisibility(1, for: 1))
//            Teleport(spirit, .forward(0.2), facing: .nearestPlayer(.outside(radius: 5), .within(radius: 30)))
//            Execute(.at(spirit), .run(Effect.give(.allPlayers(.within(radius: 10)), .speed(3, for: 1))))
//        }
        
        Section("Execute (also testing hell)") {
            Execute(As(.allPlayers), run: {
                Command("say 1")
                Command("say 2")
            })
        }
    }
    
    print(build().compileContents())
}
