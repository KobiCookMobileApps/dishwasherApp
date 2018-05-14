//
//  Dishwasher.swift
//  DishwasherApp
//
//  Created by Admin on 5/14/18.
//  Copyright © 2018 mobileappscompany. All rights reserved.
//

import Foundation


struct ApiResponse: Decodable {
    
    let products: [Dishwasher]
}

struct Dishwasher: Decodable {
    
    let title: String
    let price: [String:String]
    
}
