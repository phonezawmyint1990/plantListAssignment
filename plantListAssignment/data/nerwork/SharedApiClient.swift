//
//  SharedApiClient.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 15/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import RxSwift

class SharedApiClient: BaseApiClient{
    static let shared = SharedApiClient()
    private override init() {
    }
}

extension SharedApiClient: IApiClient{
    func postLogin(email: String, password: String) -> Observable<UserResponse> {
        let loginParm = ["email":email,"password":password]
        return self.requestApiWithoutHeaders(url: BASE_URL + API_LOGIN, method: .post, params: loginParm, value: UserResponse.self)
    }
    
    
    func getAllPlantList() -> Observable<GetAllPlantRespone> {
        return self.requestApiWithoutHeaders(url: BASE_URL + API_GET_ALL_PLANTS, method: .post, params: [:], value: GetAllPlantRespone.self)
    }
    
}
