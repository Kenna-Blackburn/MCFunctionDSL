//
//  String.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

extension String: Argument {
    func compileArgument() -> String {
        return self
    }
}
