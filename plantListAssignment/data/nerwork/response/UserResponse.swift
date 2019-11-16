//
//  UserResponse.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 16/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
class UserResponse: Codable {
    var message: String = ""
    var code: Int = 0
    var data: UserVO?
}
