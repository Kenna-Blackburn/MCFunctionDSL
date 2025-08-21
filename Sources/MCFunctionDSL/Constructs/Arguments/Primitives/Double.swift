//
//  Double.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

extension Double: Argument {
    var argumentBody: some Argument {
        String(format: "%g", self)
    }
}

extension Float: Argument {
    var argumentBody: some Argument {
        String(format: "%g", self)
    }
}
