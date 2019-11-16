//
//  TipsCollectionViewCell.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 16/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var tipsView: UIView!
    @IBOutlet weak var ivTips: UIImageView!
    @IBOutlet weak var lblTipsName: UILabel!
    @IBOutlet weak var lblTipsData: UILabel!
    
    var tip:TiP!{
        didSet {
            lblTipsData.text = tip.data
            switch tip.name {
            case "temperature":
                lblTipsName.text = "Temperature"
                ivTips.image = UIImage(named: "tmp_img")
                mainView.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                break
            case "light":
                lblTipsName.text = "Light"
                ivTips.image = UIImage(named: "light_img")
                mainView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                break
            case "placement":
                lblTipsName.text = "Placement"
                ivTips.image = UIImage(named: "placement_img")
                mainView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                break
            default:
                break
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        tipsView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner,.layerMinXMinYCorner]
        tipsView.layer.cornerRadius = 5
        
        mainView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner,.layerMinXMinYCorner]
        mainView.layer.cornerRadius = 20
    }

}
