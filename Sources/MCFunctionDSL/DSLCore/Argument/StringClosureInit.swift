//
//  StringClosureInit.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/18/25.
//

import Foundation

extension String {
    init(_ buildString: (inout String) -> Void) {
        var string = String()
        buildString(&string)
        self = string
    }
}
