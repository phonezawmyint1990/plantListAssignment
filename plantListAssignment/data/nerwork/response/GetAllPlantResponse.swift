//
//  GetAllPlantResponse.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 15/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation

class GetAllPlantRespone: Codable{
    var message: String = ""
    var code: Int = 0
    var data: [PlantVO] = []
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case code = "code"
        case data = "data"
    }
}
