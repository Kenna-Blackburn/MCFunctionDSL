//
//  QuotingString.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/21/25.
//

import Foundation

extension String {
    func quoted() -> Self {
        return #"""# + self + #"""#
    }
}

extension String? {
    func quoted() -> Self {
        guard let self else { return nil }
        return self.quoted()
    }
}
