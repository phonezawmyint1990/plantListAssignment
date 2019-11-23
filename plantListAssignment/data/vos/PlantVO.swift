//
//  PlantVO.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 15/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import RealmSwift

class PlantVO: Object, Codable {
    @objc dynamic var plantID : String = ""
    @objc dynamic var plantName: String = ""
    @objc dynamic var datumDescription : String = ""
    @objc dynamic var topTip: String = ""
    @objc dynamic var tips: Tips?
    @objc dynamic var uploadedUser: UploadedUser?
    @objc dynamic var plantPhoto: String = ""
    @objc dynamic var favourite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case plantID = "plant_id"
        case plantName = "plant_name"
        case datumDescription = "description"
        case topTip = "top_tip"
        case tips = "tips"
        case uploadedUser = "uploaded_user"
        case plantPhoto = "plant_photo"
    }
    
    override class func primaryKey() -> String? {
        return "plantID"
    }

    
    static func savePlant(responsePlantData: PlantVO, realm: Realm){
        let plantData = realm.object(ofType: PlantVO.self, forPrimaryKey: responsePlantData.plantID)
        
        if plantData == nil {
            let plant = PlantVO()
            plant.plantID = responsePlantData.plantID
            plant.plantName = responsePlantData.plantName
            plant.datumDescription = responsePlantData.datumDescription
            plant.topTip = responsePlantData.topTip
            
            let responseTip = Tips()
            responseTip.temperature = responsePlantData.tips!.temperature
            responseTip.light = responsePlantData.tips!.light
            responseTip.placement = responsePlantData.tips!.placement
            plant.tips = responseTip
            
            let responseUser = UploadedUser()
            responseUser.name = responsePlantData.uploadedUser!.name
            responseUser.userPhoto = responsePlantData.uploadedUser!.userPhoto
            responseUser.uploadedTime = responsePlantData.uploadedUser!.uploadedTime
            responseUser.userRank = responsePlantData.uploadedUser!.userRank
            
            plant.uploadedUser = responsePlantData.uploadedUser
            plant.plantPhoto = responsePlantData.plantPhoto
            
            do {
                try realm.write {
                    realm.add(plant)
                }
            }catch{
                print("Failed Saved Plant")
            }
        }
    }
}




