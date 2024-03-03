//
//  Order.swift
//  CupcakeCorner
//
//  Created by 송하민 on 3/1/24.
//

import Foundation

@Observable
class Order {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            extraFrosting = specialRequestEnabled
            addSprinkles = specialRequestEnabled
        }
    }
    var extraFrosting = false
    var addSprinkles = false
}
