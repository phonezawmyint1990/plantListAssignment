//
//  PlantDetailsViewController.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 15/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit
import SDWebImage

class PlantDetailsViewController: UIViewController {
    
    @IBOutlet weak var ivMain: UIImageView!
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var lblPlantName: UILabel!
    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var tipsCollectionView: UICollectionView!
    @IBOutlet weak var favouriteView: UIView!
    
    var plant : PlantVO!
    var tipsList: [TiP] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipsCollectionView.delegate = self
        tipsCollectionView.dataSource = self
        dataView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
        dataView.layer.cornerRadius = 30
        favouriteView.layer.cornerRadius = 10
        ivProfile.layer.cornerRadius = ivProfile.frame.size.width / 2
        ivMain.sd_setImage(with: URL(string: plant!.plant_photo))
        lblPlantName.text = plant.plant_name
        ivProfile.sd_setImage(with: URL(string: plant.uploaded_user.user_photo))
        lblUserName.text = plant.uploaded_user.name
        lblDescription.text = plant.description
        
        let nib = UINib(nibName: String(describing: TipsCollectionViewCell.self), bundle: nil)
        tipsCollectionView.register(nib, forCellWithReuseIdentifier: String(describing: TipsCollectionViewCell.self))
        
        let layout = tipsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 5
        layout.itemSize = CGSize(width: 130, height: 180)
        tipsList.append(TiP(name: "temperature", data: plant.tips.temperature))
        tipsList.append(TiP(name: "light", data: plant.tips.light))
        tipsList.append(TiP(name: "placement", data: plant.tips.placement))
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
