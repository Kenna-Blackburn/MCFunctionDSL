//
//  Bool.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

extension Bool: Argument {
    var argumentBody: some Argument {
        self.description
    }
}
