//
//  Erase.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/24/25.
//

import Foundation

extension Argument {
    func erase() -> ArgumentGroup {
        ArgumentGroup(self)
    }
}
