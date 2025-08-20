//
//  If.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

extension MCComponent {
    @MCComponentBuilder
    func `if`(_ condition: Bool) -> some MCComponent {
        if condition {
            self
        }
    }
    
    @MCComponentBuilder
    func `if`(_ condition: Bool, apply: (Self) -> some MCComponent) -> some MCComponent {
        if condition {
            apply(self)
        } else {
            self
        }
    }
}
