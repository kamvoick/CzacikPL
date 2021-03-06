//
//  DataService.swift
//  Czacik
//
//  Created by Kamil Wójcik on 23.06.2016.
//  Copyright © 2016 Kamil Wójcik. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

let URL = "czacik-35e24.firebaseio.com"

class DataService {

    static let ds = DataService()
    
    // Static variable means there's only one instance of it in memory
    // static let ds oznacza że jest zewnątrzdostępna
    
    private var _REF_BASE = FIRDatabase.database().reference()
    private var _REF_POSTS = FIRDatabase.database().referenceFromURL("\(URL)/posts")
    private var _REF_USERS = FIRDatabase.database().referenceFromURL("\(URL)/users")
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: FIRDatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    func createFirebaseUser(uid: String, user: Dictionary<String, String>) {
        //pobiera uid od konkretnego użytkonika
        //jeżeli nie ma tworzy nowe
        
        REF_USERS.child(uid).setValue(user)
    }
    
    
    var REF_USER_CURRENT: FIRDatabaseReference {
        let uid = NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) as! String
        let user = FIRDatabase.database().referenceFromURL("\(URL)").child("users").child(uid)
        return user
    }
}
