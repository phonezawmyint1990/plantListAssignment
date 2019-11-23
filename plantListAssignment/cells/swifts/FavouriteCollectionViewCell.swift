//
//  FavouriteCollectionViewCell.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 22/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit
import SDWebImage

class FavouriteCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var ivPlantImage: UIImageView!
    var mdata : PlantVO?{
        didSet{
            ivPlantImage.sd_setImage(with: URL(string: mdata!.plantPhoto))
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 5
        ivPlantImage.layer.cornerRadius = 5
        ivPlantImage.layer.borderWidth = 1
        ivPlantImage.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }

}
