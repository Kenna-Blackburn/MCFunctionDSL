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
        level: Int = 1,
        padding: (leading: Bool, trailing: Bool) = (false, false)
    ) -> some MCComponent {
        LineBreak().if(padding.leading)
        
        Comment(content, level: level)
        self
        
        LineBreak().if(padding.trailing)
    }
}
