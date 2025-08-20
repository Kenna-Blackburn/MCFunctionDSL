//
//  ExecuteSubcommand.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

protocol ExecuteSubcommand: Argument {}
extension ExecuteSubcommand {
    static func `as`(_ target: TargetSelector) -> As {
        return .init(target)
    }
}
