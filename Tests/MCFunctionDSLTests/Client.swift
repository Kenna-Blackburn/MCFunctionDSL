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
                .commenting("yes thats my minecraft username too")
            
            Kill(.allEntities(.named("remove_me"), ._not(.named("do_not_remove"))))
                .commenting("`.notNamed(_:)` coming soon")
        }
        
        Section("Argument Testing Hell") {
            _ArgumentGroup("1", _Unpadding("2"), "3")
            _ArgumentGroup("1", _Unpadding("2"), _Unpadding("3"), "4")
            
            _ArgumentGroup("+1").indenting(by: 1)
            _ArgumentGroup("+2").indenting(by: 2)
            _ArgumentGroup("+3").indenting(by: 3)
        }
        
        Section("Effect") {
            Effect.give(.allEntities(.named("hide")), .invisibility(1, for: 1), hideParticles: true)
            Effect.clear(.allEntities(.named("show")))
        }
    }
    
    print(build().compileContents())
}
