//
//  PlantListViewModel.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 15/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class PlantListViewModel: BaseViewModel {
    public var isLoadingObs: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    public var _errorObs: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    let apiService = SharedApiClient.shared
    let bag = DisposeBag()
    public var plantList: PublishSubject<[PlantVO]> = PublishSubject()
    
    override init() {}
    
    public func requestData(){
        apiService.getAllPlantList()
            .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
            .subscribe(onNext:{response in
                self.isLoadingObs.accept(true)
                self.plantList.onNext(response.data)
            }).disposed(by: bag)
    }
}
