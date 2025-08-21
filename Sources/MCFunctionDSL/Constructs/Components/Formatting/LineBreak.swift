//
//  LineBreak.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/18/25.
//

import Foundation

struct LineBreak: MCComponent {
    var isExecutable: Bool = false
    
    var componentBody: some MCComponent {
        Command(children: [])
    }
}
