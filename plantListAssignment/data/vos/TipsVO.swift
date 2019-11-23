//
//  TipsVO.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 15/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import RealmSwift

//class TipsVO: Codable {
//    var temperature: String = ""
//    var light: String = ""
//    var placement: String = ""
//
//    enum CodingKeys: String, CodingKey{
//        case temperature,light,placement
//    }
//}

class Tips: Object, Codable {
    @objc dynamic var temperature: String = ""
    @objc dynamic var light: String = ""
    @objc dynamic var placement: String = ""

    enum CodingKeys: String, CodingKey {
        case temperature = "temperature"
        case light = "light"
        case placement = "placement"
    }
}


