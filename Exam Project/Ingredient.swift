//
//  Ingredient.swift
//  Exam Project
//
//  Created by admin on 18/06/2019.
//  Copyright © 2019 KEA. All rights reserved.
//

import Foundation
import UIKit

class Ingredient {
    
    var image: UIImage
    var name: String
    var input: Float
    var calculatedInput: String
    var output: Float
    var type: String
    
    init(image: UIImage, name: String, input: Float, calculatedInput: String, output: Float, type: String) {
        self.image = image
        self.name = name
        self.input = input
        self.calculatedInput = calculatedInput
        self.output = output
        self.type = type
    }
    
}
