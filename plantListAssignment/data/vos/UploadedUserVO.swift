//
//  UploadedUserVO.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 15/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import RealmSwift

//class UploadedUserVO: Codable {
//    var name: String = ""
//    var user_photo: String =  ""
//    var uploaded_time: String = ""
//    var user_rank: String = ""
//
//    enum CodingKeys: String, CodingKey{
//        case name,user_photo,uploaded_time,user_rank
//    }
//}

class UploadedUser: Object, Codable {
    @objc dynamic var name: String = ""
    @objc dynamic var userPhoto: String = ""
    @objc dynamic var uploadedTime = ""
    @objc dynamic var userRank: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case userPhoto = "user_photo"
        case uploadedTime = "uploaded_time"
        case userRank = "user_rank"
    }
}
