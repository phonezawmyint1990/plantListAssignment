//
//  UploadedUserVO.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 15/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
class UploadedUserVO: Codable {
    var name: String = ""
    var user_photo: String =  ""
    var uploaded_time: String = ""
    var user_rank: String = ""
    
    enum CodingKeys: String, CodingKey{
        case name,user_photo,uploaded_time,user_rank
    }
}
