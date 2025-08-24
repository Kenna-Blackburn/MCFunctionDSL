//
//  Fill.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/23/25.
//

import Foundation

struct Fill: MCComponent {
    let position1: Position
    let position2: Position
    let block: Block
    let fillMode: Mode?
    
    let inferSetBlock: Bool
    
    init(
        from position1: Position,
        to position2: Position,
        with block: Block,
        fillMode: Mode? = nil,
        inferSetBlock: Bool = true
    ) {
        self.position1 = position1
        self.position2 = position2
        self.block = block
        self.fillMode = fillMode
        self.inferSetBlock = inferSetBlock
    }
    
    var componentBody: some MCComponent {
        if inferSetBlock, position1 == position2 {
            SetBlock(
                at: position1,
                to: block,
                fillMode: fillMode
            )
        } else {
            Command(
                "fill",
                position1,
                position2,
                block,
                fillMode
            )
        }
    }
}

extension Fill {
    enum Mode: Argument {
        case destroy
        case hollow
        case keep
        case outline
        case replace(Block)
        
        var argumentBody: some Argument {
            switch self {
            case .destroy:
                "destroy".erase()
            case .hollow:
                "hollow".erase()
            case .keep:
                "keep".erase()
            case .outline:
                "outline".erase()
            case .replace(let block):
                ArgumentGroup("replace", block)
            }
        }
    }
}
