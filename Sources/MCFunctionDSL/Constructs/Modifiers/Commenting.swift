//
//  Commenting.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/18/25.
//

import Foundation

extension MCComponent {
    @MCComponentBuilder
    func commenting(
        _ content: String,
        level: Int = 1
    ) -> some MCComponent {
        Comment(content, level: level)
        self
    }
}
