//
//  Rotation.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/21/25.
//

import Foundation

struct Rotation: Argument {
    let pitch: Double // y
    let yaw: Double   // x
    
    init(pitch: Double, yaw: Double) {
        self.pitch = pitch
        self.yaw = yaw
    }
    
    func compileArgument() -> String {
        return ArgumentGroup(pitch, yaw).compileArgument()
    }
}
