//
//  LineBreak.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/18/25.
//

import Foundation

struct LineBreak: MCComponent {
    var body: some MCComponent {
        Command(children: [])
    }
}

typealias NewLine = LineBreak
typealias Break = LineBreak
