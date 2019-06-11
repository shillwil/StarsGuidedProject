//
//  StarController.swift
//  Stars
//
//  Created by Alex Shillingford on 6/11/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

class StarController {
    private(set) var stars: [Star] = []
    
    func addStar(named name: String, withDistance distance: Double) {
        let star = Star(name: name, distance: distance)
        stars.append(star)
    }
}
