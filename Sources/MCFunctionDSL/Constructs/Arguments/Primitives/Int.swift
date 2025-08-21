//
//  Int.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

extension Int: Argument {
    var argumentBody: some Argument {
        String(self)
    }
}

extension UInt: Argument {
    var argumentBody: some Argument {
        String(self)
    }
}

extension UInt8: Argument {
    var argumentBody: some Argument {
        String(self)
    }
}
