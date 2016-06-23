 //
//  textField.swift
//  Czacik
//
//  Created by Kamil Wójcik on 23.06.2016.
//  Copyright © 2016 Kamil Wójcik. All rights reserved.
//

import UIKit

class textField: UITextField {

    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.borderColor = UIColor(red: kolorCienia, green: kolorCienia, blue: kolorCienia, alpha: 0.5).CGColor
        layer.borderWidth = 1.0
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 0)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 0)
    }

}
