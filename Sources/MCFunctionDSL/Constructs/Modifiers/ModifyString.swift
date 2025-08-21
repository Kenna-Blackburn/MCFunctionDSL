//
//  ModifyingString.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/21/25.
//

import Foundation

extension ArgumentGroup {
    func modifyingString(_ modify: (String) -> String) -> ArgumentGroup {
        return ArgumentGroup(modify(compileArgument()))
    }
}
