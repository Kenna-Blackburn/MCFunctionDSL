//
//  Array.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

extension Array: Argument where Element: Argument {
    func compileArgument() -> String {
        return _ArgumentGroup(children: self).compileArgument()
    }
}
