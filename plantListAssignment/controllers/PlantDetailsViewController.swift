//
//  PlantDetailsViewController.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 15/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit
import SDWebImage
import RealmSwift

class PlantDetailsViewController: UIViewController {
    
    @IBOutlet weak var ivMain: UIImageView!
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var lblPlantName: UILabel!
    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var tipsCollectionView: UICollectionView!
    @IBOutlet weak var favouriteView: UIView!
    @IBOutlet weak var ivFavourite: UIImageView!
    
    var plant : PlantVO!
    var tipsList: [TiP] = []
    var isFavouritePlant: Bool = false
    let realm = try! Realm()
    let viewModel = PlantDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipsCollectionView.delegate = self
        tipsCollectionView.dataSource = self
        dataView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
        dataView.layer.cornerRadius = 30
        favouriteView.layer.cornerRadius = 10
        ivProfile.layer.cornerRadius = ivProfile.frame.size.width / 2
        ivMain.sd_setImage(with: URL(string: plant!.plantPhoto))
        lblPlantName.text = plant.plantName
        ivProfile.sd_setImage(with: URL(string: plant.uploadedUser!.userPhoto))
        lblUserName.text = "by " + plant.uploadedUser!.name
        lblDescription.text = plant.datumDescription
        
        let nib = UINib(nibName: String(describing: TipsCollectionViewCell.self), bundle: nil)
        tipsCollectionView.register(nib, forCellWithReuseIdentifier: String(describing: TipsCollectionViewCell.self))
        
        let layout = tipsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 5
        layout.itemSize = CGSize(width: 130, height: 180)
        tipsList.append(TiP(name: "temperature", data: plant.tips!.temperature))
        tipsList.append(TiP(name: "light", data: plant.tips!.light))
        tipsList.append(TiP(name: "placement", data: plant.tips!.placement))
    
        let favouriteTap = MyTapGesture(target: self, action: #selector(favouriteTapped))
        favouriteTap.plandId = self.plant.plantID
        favouriteView.isUserInteractionEnabled = true
        favouriteView.addGestureRecognizer(favouriteTap)
        
        isFavouritePlant = viewModel.isFavouritePlant(plantId: plant.plantID, realm: realm)
        if isFavouritePlant {
           ivFavourite.image = UIImage(named: "plant_favourite")
        }else{
           ivFavourite.image = UIImage(named: "plant_non_favourite")
        }
    }
    
    
    @objc func favouriteTapped(sender: MyTapGesture){
        let id = sender.plandId
        let fetchPlant = realm.objects(PlantVO.self).filter("plantID = %@", id)
        if let updatePlant = fetchPlant.first {
            try! realm.write {
                if updatePlant.favourite {
                    updatePlant.favourite = false
                }else{
                    updatePlant.favourite = true
                }
            realm.add(updatePlant)
            }
        }
        isFavouritePlant = viewModel.isFavouritePlant(plantId: plant.plantID, realm: realm)
        if isFavouritePlant {
            ivFavourite.image = UIImage(named: "plant_favourite")
        }else{
            ivFavourite.image = UIImage(named: "plant_non_favourite")
        }
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.dismiss(animated: true, completion:    nil)
    }
}

extension PlantDetailsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tipsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TipsCollectionViewCell.self), for: indexPath) as! TipsCollectionViewCell
        item.tip = tipsList[indexPath.row]
        return item
    }
}
extension PlantDetailsViewController: UICollectionViewDelegate{
    
}


class MyTapGesture: UITapGestureRecognizer {
    var plandId = String()
}
