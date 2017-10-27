//
//  array.swift
//  Oceans Study APP
//
//  Copyright © 2016 Jacob Bryon. All rights reserved.
//

import Foundation

extension Array {
    func sample() -> Element {
        let randomIndex = Int(arc4random()) % count
        return self[randomIndex]
    }
}


