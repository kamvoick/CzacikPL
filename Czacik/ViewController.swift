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
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var poleEmailLogin: textField!
    @IBOutlet weak var polePassword: textField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //logowanie z pamięci
        if NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) != nil {
            self.performSegueWithIdentifier(SEGUE_ZALOGOWANY, sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fbPrzycisk(sender: UIButton!){
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self, handler: {
            (facebookResult, facebookError) -> Void in
            if facebookError != nil {
                print("Facebook login failed. Error \(facebookError)")
            } else if facebookResult.isCancelled {
                print("Facebook login was cancelled.")
            } else {
                // firebase auth..
                
                let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
                
                FIRAuth.auth()?.signInWithCredential(credential, completion: { (authData: FIRUser?, error: NSError?) in
                    if error != nil {
                        print("Logowanie do Firebase nie powiodło się. \(error)")
                    } else {
                        print("Zalogowany w Firebase!")
                        
                        let user: [String: String] = ["provider": credential.provider, "blah": "test"]
                        
                        DataService.ds.createFirebaseUser(authData!.uid, user: user)
                        
                        NSUserDefaults.standardUserDefaults().setValue(authData?.uid, forKey: KEY_UID)
                        self.performSegueWithIdentifier(SEGUE_ZALOGOWANY, sender: nil)
                    }
                })
            }
        })
    }
    
    @IBAction func logowanie(sender: AnyObject) {
        if let email = poleEmailLogin.text where email != "", let password = polePassword.text where password != "" {
            
            FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { (user: FIRUser?, error: NSError?) in
                
                if error != nil {
                    print("Jest już takie konto użytkownika)")
//                    self.login()
                } else {
                    print("Konto użytkownika stworzone")
//                    self.login()
                }
            })
            
        }else{
            let alert = UIAlertController(title: "Wpisz login i hasło", message: nil, preferredStyle: .Alert)
            let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
    
}

