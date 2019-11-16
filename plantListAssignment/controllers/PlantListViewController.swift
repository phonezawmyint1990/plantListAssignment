//
//  PlantListViewController.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 15/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PlantListViewController: UIViewController {
    @IBOutlet weak var ivMain: UIImageView!
    @IBOutlet weak var uiSearchBar: UISearchBar!
    @IBOutlet weak var plantListTableView: UITableView!
    
    let viewModel = PlantListViewModel()
    var mPlantList: [PlantVO] = []
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivMain.layer.cornerRadius = 20
        plantListTableView.register(UINib(nibName: String(describing: PlantTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PlantTableViewCell.self))
        plantListTableView.rowHeight = 205
        plantListTableView.separatorColor = UIColor.clear
        viewModel.requestData()
        plantListFetchData()
       
    }
    
    func plantListFetchData(){
        viewModel.plantList.observeOn(MainScheduler.instance)
            .bind(to: plantListTableView.rx.items){ tableView,index,item in
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PlantTableViewCell.self), for: IndexPath(row: index, section: 0)) as! PlantTableViewCell
            cell.mdata = item
            cell.delegate = self
            return cell
        }.disposed(by: bag)
    }
}

extension PlantListViewController: PlantDetailsActionDelegate{
    func onClickPlantDetails(plant: PlantVO) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: PlantDetailsViewController.self)) as! PlantDetailsViewController
        vc.plant = plant
        self.present(vc, animated: true, completion: nil)
    }
}
