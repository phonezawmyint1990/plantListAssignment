//
//  LoginViewModel.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 16/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class LoginViewModel: BaseViewModel {
    public var isLoadingObs: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    public var _errorObs: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    let apiService = SharedApiClient.shared
    let bag = DisposeBag()
    public var userResponse: PublishSubject<UserResponse> = PublishSubject()
    
    override init() {}
    
    public func requestLoginData(email:String,password:String){
        apiService.postLogin(email: email, password: password)
            .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
            .subscribe(onNext:{response in
                self.isLoadingObs.accept(true)
                self.userResponse.onNext(response)
            }).disposed(by: bag)
    }
}
