//
//  LoginViewController.swift
//  plantListAssignment
//
//  Created by Aung Ko Ko on 14/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {
    @IBOutlet weak var btnLogin: UIView!
    @IBOutlet weak var txtEmailId: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var viewModel = LoginViewModel()
     let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.roundCorners([.topRight,.bottomRight], radius: 30)
        let btnLoginTap = UITapGestureRecognizer(target: self, action: #selector(btnLoginTapped))
        btnLogin.addGestureRecognizer(btnLoginTap)
        //viewModel.requestLoginData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if UserDefaults.standard.string(forKey: IS_LOGIN) != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: String(describing: PlantListViewController.self)) as! PlantListViewController
            self.present(vc, animated: true, completion: nil)
        }
    }
    @objc func btnLoginTapped(){
//        if (UserDefaults.standard.string(forKey: IS_LOGIN) != nil) {
//            print("OK")
//        }else{
//            print("Not OK")
//        }
        
        viewModel.requestLoginData(email: txtEmailId.text ?? "john@gmail.com" , password: txtPassword.text ?? "123456")
        viewModel.userResponse.observeOn(MainScheduler.instance)
            .subscribe(onNext:{user in
                if user.message == "Success"{
                    UserDefaults.standard.set(true, forKey: IS_LOGIN)
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: String(describing: PlantListViewController.self)) as! PlantListViewController
                    self.present(vc, animated: true, completion: nil)
                }
            },onError:{err in
                
            }).disposed(by: bag)
    }
}
