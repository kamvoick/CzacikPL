//
//  ViewController.swift
//  Czacik
//
//  Created by Kamil Wójcik on 23.06.2016.
//  Copyright © 2016 Kamil Wójcik. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fbPrzycisk(sender: UIButton!){
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["email"]) { (facebookResult: FBSDKLoginManagerLoginResult!, facebookErr: NSError!) in
            
            if facebookErr != nil{
                print("Logowanie do facebooka nie powiodło się. Błąd: \(facebookErr)")
            }else{
                let tokenDostępu = FBSDKAccessToken.currentAccessToken().tokenString //jeżeli się zalogujemy to dostaniemy token od fb
                print("zalogowano się do fb. \(tokenDostępu)")
            }
        }
    }

}

