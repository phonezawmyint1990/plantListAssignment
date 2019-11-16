//
//  BaseApiClient.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 15/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import Alamofire
import RxCocoa
import RxSwift

open class BaseApiClient {
    fileprivate let BASE_URL =
    "https://80032420-e94c-49d3-8c8b-570639a026cc.mock.pstmn.io/"
    func requestApiWithoutHeaders<T>(url:String,
                                     method:HTTPMethod,
                                     params: Parameters,
                                     value: T.Type
        ) -> Observable<T> where T : Codable{
        
        let headers: HTTPHeaders = [
            "Authorization" : ""
        ]
        let decoder = JSONDecoder()
        return  Observable<T>.create{ (observer) -> Disposable in
            let request = Alamofire.request(url , method: method, parameters: params, headers: headers).responseJSON{ response in
                switch response.result {
                case .success :
                    if 200 ... 299 ~= response.response?.statusCode ?? 500 {
                        let data = response.data!
                        let returndata  = try! decoder.decode(T.self, from: data)
                        observer.onNext(returndata)
                        observer.onCompleted()
                        
                    }else{
                        let error = response.data!
                        let returndata  = try! decoder.decode(ErrorResponse.self, from: error)
                        observer.onError(returndata as! Error)
                    }
                case .failure(let err):
                    observer.onError(err)
                }
            }
            
            return Disposables.create(with: {
                request.cancel()
            })
        }
        
    }
}
