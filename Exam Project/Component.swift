//
//  Component.swift
//  Exam Project
//
//  Created by admin on 16/06/2019.
//  Copyright © 2019 KEA. All rights reserved.
//

import Foundation
import UIKit

class Component {
    
    var image: UIImage
    var name: String
    var building: String
    var output: Float
    var ingredients: Dictionary<String, Dictionary<String, Any>>
    
    init(image: UIImage, name: String, building: String, output: Float, ingredients: Dictionary<String, Dictionary<String, Any>>) {
        self.image = image
        self.name = name
        self.building = building
        self.output = output
        self.ingredients = ingredients
    }
    
}


