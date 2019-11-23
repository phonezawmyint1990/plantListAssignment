//
//  PlantDetailsViewModel.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 22/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import RealmSwift
import RxCocoa
import RxSwift

class PlantDetailsViewModel: BaseViewModel {
     func isFavouritePlant(plantId: String, realm: Realm) -> Bool{
        let movie = realm.object(ofType: PlantVO.self, forPrimaryKey: plantId)
        if movie != nil {
            if movie!.favourite {
                return true
            }else{
                return false
            }
        }else{
            return false
        }
    }
}
