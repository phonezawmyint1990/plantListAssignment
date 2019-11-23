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
import RealmSwift
import LGSideMenuController
class PlantListViewController: UIViewController {
    @IBOutlet weak var ivMain: UIImageView!
    @IBOutlet weak var uiSearchBar: UISearchBar!
    @IBOutlet weak var plantListTableView: UITableView!
    @IBOutlet weak var ivLeftMenu: UIImageView!
    
    let viewModel = PlantListViewModel()
    var mPlantList: [PlantVO] = []
    let bag = DisposeBag()
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivMain.layer.cornerRadius = 20
        plantListTableView.register(UINib(nibName: String(describing: PlantTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PlantTableViewCell.self))
        plantListTableView.rowHeight = 205
        plantListTableView.separatorColor = UIColor.clear
        viewModel.requestData()
        plantListFetchData()
        plantListTableView.dataSource = self
        plantListTableView.delegate = self
        
        let leftMenu = UITapGestureRecognizer(target: self, action: #selector(leftMenuGesture))
        ivLeftMenu.isUserInteractionEnabled = true
        ivLeftMenu.addGestureRecognizer(leftMenu)
    }
    
    @objc func leftMenuGesture(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: FavouriteViewController.self)) as! FavouriteViewController

        self.present(vc, animated: true, completion: nil)
        
//        let vc = (UIApplication.shared.keyWindow?.rootViewController) as! LGSideMenuController
//        vc.showLeftViewAnimated()
    
    }
    
    
    func plantListFetchData(){
        viewModel.plantDataObs.observeOn(MainScheduler.instance)
            .subscribe(onNext:{data in
                self.bindData(data: data)
            }).disposed(by: bag)
    }
    
    func bindData(data:[PlantVO]) {
        self.mPlantList = data
        plantListTableView.reloadData()
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

extension PlantListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mPlantList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PlantTableViewCell.self), for: indexPath) as! PlantTableViewCell
        cell.mdata = self.mPlantList[indexPath.row]
        cell.delegate = self
        return cell
    }
    
}
extension PlantListViewController: UITableViewDelegate{
    
}
