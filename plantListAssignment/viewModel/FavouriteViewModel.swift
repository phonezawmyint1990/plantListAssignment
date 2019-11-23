//
//  FavouriteViewModel.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 22/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import RealmSwift
import RxCocoa
import RxSwift

class FavouriteViewModel: BaseViewModel {
    let realm = try! Realm()
    let db = RealmHelper.shared
    let bag = DisposeBag()
    var favouritePlantObs:BehaviorRelay<[PlantVO]> = BehaviorRelay(value: [])
    public var isLoadingObs: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    public var _errorObs: BehaviorRelay<String?> = BehaviorRelay(value: nil)
     override init() {}
    public func favouriteData(){
        db.favouritePlants().subscribe(onNext:{data in
            if data.count > 0 {
                self.isLoadingObs.accept(false)
                self.favouritePlantObs.accept(data)
            }
        }, onError:{error in
            
        }).disposed(by: bag)
    }
}
