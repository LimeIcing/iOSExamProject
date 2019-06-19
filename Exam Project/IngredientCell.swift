//
//  IngredientCell.swift
//  Exam Project
//
//  Created by admin on 18/06/2019.
//  Copyright © 2019 KEA. All rights reserved.
//

import UIKit

class IngredientCell: UITableViewCell {

    @IBOutlet weak var ingredientImageView: UIImageView!
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var ingredientInputLabel: UILabel!
    
    func setIngredient(ingredient: Ingredient) {
        ingredientImageView.image = ingredient.image
        ingredientLabel.text = ingredient.name
        ingredientInputLabel.text = ingredient.calculatedInput
    }
    
}
