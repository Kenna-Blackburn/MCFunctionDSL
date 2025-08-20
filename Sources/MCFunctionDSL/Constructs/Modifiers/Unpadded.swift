//
//  Unpadded.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

extension Argument {
    func unpaddingArgument() -> some Argument {
        return _Unpadding(self)
    }
}

extension ArgumentGroup {
    func unpaddingChildren() -> some Argument {
        let newChildren = self
            .children
            .map { child in
                guard let child else { return _Unpadding?.none }
                return _Unpadding(child)
            }
        
        return ArgumentGroup(children: newChildren)
    }
}
