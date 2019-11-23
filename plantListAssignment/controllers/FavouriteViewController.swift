//
//  FavouriteViewController.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 22/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RealmSwift

class FavouriteViewController: UIViewController {
    @IBOutlet weak var favouriteCollectionView: UICollectionView!
    let numberOfItemPerRow:CGFloat = 3.0
    let spacing: CGFloat = 5
    let viewModel = FavouriteViewModel()
    var mfavouriteList: [PlantVO] = []
    let bag = DisposeBag()
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favouriteCollectionView.delegate = self
        favouriteCollectionView.dataSource = self
        favouriteCollectionView.register(UINib(nibName: String(describing: FavouriteCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: FavouriteCollectionViewCell.self))
        
        let totalPadding:CGFloat = numberOfItemPerRow * spacing
        let itemWidth = (self.view.frame.width - totalPadding)/numberOfItemPerRow
        
        let layout = favouriteCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 5
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        viewModel.favouriteData()
        
        viewModel.favouritePlantObs.subscribeOn(MainScheduler.instance)
            .subscribe(onNext:{data in
                self.bindData(data: data)
            }).disposed(by: bag)
    }
    
    
    func bindData(data:[PlantVO]) {
        self.mfavouriteList = data
        favouriteCollectionView.reloadData()
    }
    @IBAction func backBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension FavouriteViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mfavouriteList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FavouriteCollectionViewCell.self), for: indexPath) as! FavouriteCollectionViewCell
        item.mdata = mfavouriteList[indexPath.row]
        return item
    }
    
    
}

extension FavouriteViewController: UICollectionViewDelegate{
    
}
