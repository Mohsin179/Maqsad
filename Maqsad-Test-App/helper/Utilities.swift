//
//  Utilities.swift
//  Maqsad-Test-App
//
//  Created by Mohsin Hassan on 04/10/2022.
//

import Foundation
import UIKit

class Utilities {
    
    static func StyleButton(_ button: UIButton){
        button.layer.cornerRadius = 15
        // button.backgroundColor = UIColor.init(red: 156, green: 36, blue: 38, alpha:1)
    }
    
    static func styleView(_ viewfield: UIView){
        
        viewfield.layer.borderWidth = 0.5
        viewfield.layer.borderColor = UIColor.white.cgColor
        viewfield.layer.shadowRadius = 5
        viewfield.layer.shadowColor = UIColor.red.cgColor
        viewfield.layer.cornerRadius = 27
        
    }
    
    static func imageStyle(_ image: UIImageView){
        
        image.layer.cornerRadius = 60
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.black.cgColor
        
        
    }
}
