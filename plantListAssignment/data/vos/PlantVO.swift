//
//  PlantVO.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 15/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
class PlantVO: Codable {
    var plant_id: String = ""
    var plant_name: String = ""
    var description: String = ""
    var top_tip: String = ""
    var tips: TipsVO
    var uploaded_user: UploadedUserVO
    var plant_photo: String = ""
    
    enum CodingKeys: String, CodingKey{
        case plant_id,plant_name,description,top_tip,tips,uploaded_user,plant_photo
    }
}
