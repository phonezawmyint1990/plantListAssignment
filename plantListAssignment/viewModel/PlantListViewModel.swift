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
import RealmSwift

class PlantListViewModel: BaseViewModel {
    public var isLoadingObs: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    public var _errorObs: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    let apiService = SharedApiClient.shared
    let bag = DisposeBag()
    public var plantList: PublishSubject<[PlantVO]> = PublishSubject()
    public var realmPlantList: Results<PlantVO>?
    
    var plantDataObs:BehaviorRelay<[PlantVO]> = BehaviorRelay(value: [])
    
    let realm = try! Realm()
    let db = RealmHelper.shared
    
    override init() {}
    
    public func requestData(){
//        apiService.getAllPlantList()
//            .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
//            .subscribe(onNext:{response in
//                self.isLoadingObs.accept(true)
//                response.data.forEach{ plant in
//                    PlantVO.savePlant(responsePlantData: plant, realm: self.realm)
//                }
//                self.plantList.onNext(response.data)
//                do{
//                    self.realmPlantList = try self.realm.objects(PlantVO.self)
//                }catch{
//                    print("Failed Fetch Plants From Database")
//                }
//
//            }).disposed(by: bag)
        
        
//        apiService.getAllPlantList()
//        .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
//            .subscribe(onNext:{data in
//                self.isLoadingObs.accept(false)
//                self.plantDataObs.accept(data.data)
//                self.db.insertAllPlants(data: data.data)
//            }, onError:{error in
//                self.isLoadingObs.accept(false)
//                self._errorObs.accept(error.localizedDescription)
//            }).disposed(by: bag)
        
        db.retrievePlants().subscribe(onNext:{ data in
            if data.count > 0 {
                self.isLoadingObs.accept(false)
                self.plantDataObs.accept(data)
            }else{
                self.apiService.getAllPlantList()
                    .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
                    .subscribe(onNext:{data in
                        self.isLoadingObs.accept(false)
                        self.plantDataObs.accept(data.data)
                        self.db.insertAllPlants(data: data.data)
                    }, onError:{error in
                        self.isLoadingObs.accept(false)
                        self._errorObs.accept(error.localizedDescription)
                    }).disposed(by: self.bag)
            }

        }).disposed(by: bag)
    }
}
