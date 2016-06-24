//
//  DataService.swift
//  Czacik
//
//  Created by Kamil Wójcik on 23.06.2016.
//  Copyright © 2016 Kamil Wójcik. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    static let ds = DataService() // tworzymy globalnie dostępną, niezmienną wartość
    
    private var _ref_base = FIRDatabase.database().referenceFromURL("https://mojapierwsza.firebaseio.com/#-KJq36Bn1RLTmEsAjjGg|fc1c1ae5c4abc992354f1883d84a9d35")
    
    var ref_base: FIRDatabaseReference{
        return _ref_base
    }
}
