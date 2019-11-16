//
//  PlantTableViewCell.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 15/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit
import SDWebImage

class PlantTableViewCell: UITableViewCell {
    @IBOutlet weak var ivPlantPhoto: UIImageView!
    @IBOutlet weak var ivPlantFavourite: UIImageView!
    @IBOutlet weak var lblPlantName: UILabel!
    @IBOutlet weak var lblUploadedUserName: UILabel!
    @IBOutlet weak var ivUploadedUserPhoto: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    var delegate: PlantDetailsActionDelegate?
    
    var mdata : PlantVO?{
        didSet{
            ivPlantPhoto.sd_setImage(with: URL(string: mdata!.plant_photo))
            lblPlantName.text = mdata?.plant_name
            lblUploadedUserName.text = mdata?.uploaded_user.name
            ivUploadedUserPhoto.sd_setImage(with: URL(string: mdata!.uploaded_user.user_photo))
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        ivUploadedUserPhoto.layer.cornerRadius = ivUploadedUserPhoto.frame.size.width / 2
        ivUploadedUserPhoto.clipsToBounds = true
        ivPlantPhoto.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
        ivPlantPhoto.layer.cornerRadius = 30
        inintGestureRecognizer()
    }

    func inintGestureRecognizer(){
        let imgTapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickDetails))
        ivPlantPhoto.isUserInteractionEnabled = true
        ivPlantPhoto.addGestureRecognizer(imgTapGesture)
    }
    
    @objc func onClickDetails(){
        delegate?.onClickPlantDetails(plant: mdata!)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
