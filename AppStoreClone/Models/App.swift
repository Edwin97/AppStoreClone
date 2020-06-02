//
//  App.swift
//  AppStoreClone
//
//  Created by edwin on 01/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import Foundation

struct App: Codable {
    var id: Int?
    var name: String?
    var category: String?
    var price: Double?
    var imageName: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case category = "Category"
        case price = "Price"
        case imageName = "ImageName"
    }
}
