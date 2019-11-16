//
//  IApiClient.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 15/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import RxSwift

protocol IApiClient {
    func getAllPlantList() -> Observable<GetAllPlantRespone>
    func postLogin(email: String,password: String) -> Observable<UserResponse>
}
