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
    }
    
    print(build().compileContents())
}
