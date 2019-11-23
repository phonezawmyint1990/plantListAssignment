//
//  RealmHelper.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 22/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import RxRealm
import RxSwift

class RealmHelper {
    let realm = try! Realm()
    
    static let shared:RealmHelper = RealmHelper()
    
    private init(){}
    
    func insertAllPlants(data:[PlantVO]){
        try! realm.write() {
            realm.add(data,update: .modified)
        }
    }
    
    func retrievePlants() -> Observable<[PlantVO]> {
        return Observable.array(from:realm.objects(PlantVO.self))
    }
    
    func favouritePlants() -> Observable<[PlantVO]>{
        return Observable.array(from: realm.objects(PlantVO.self).filter("favourite == %@" , true))
    }
}
