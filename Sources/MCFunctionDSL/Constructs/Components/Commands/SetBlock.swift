//
//  SetBlock.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/24/25.
//

import Foundation

struct SetBlock: MCComponent {
    let position: Position
    let block: Block
    let fillMode: Fill.Mode?
    
    init(
        at position: Position,
        to block: Block,
        fillMode: Fill.Mode? = nil
    ) {
        self.position = position
        self.block = block
        self.fillMode = fillMode
    }
    
    var componentBody: some MCComponent {
        Command(
            "setblock",
            position,
            block,
            fillMode
        )
    }
}
