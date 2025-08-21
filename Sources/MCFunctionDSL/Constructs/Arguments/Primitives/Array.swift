//
//  Array.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

extension Array: Argument where Element: Argument {
    var argumentBody: some Argument {
        ArgumentGroup(children: self)
    }
}
