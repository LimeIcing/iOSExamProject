//
//  CalculatorView.swift
//  Exam Project
//
//  Created by admin on 17/06/2019.
//  Copyright © 2019 KEA. All rights reserved.
//

import UIKit
import Firebase

class CalculatorView: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var component: Component!
    var ingredients: [Ingredient] = []
    
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var clockSpeedLabel: UILabel!
    @IBOutlet weak var outputInputField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = component.name
        titleImage.image = component.image
        outputInputField.text = "\(component.output)"
        createIngredientList()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func createIngredientList() {
        for i in component.ingredients {
            var image: UIImage
            
            switch i.key {
            case "iron ingot":
                image = #imageLiteral(resourceName: "128px-Iron_Ingot")
            case "iron rod":
                image = #imageLiteral(resourceName: "128px-Iron_Rod")
            case "iron plate":
                image = #imageLiteral(resourceName: "128px-Iron_Plate")
            case "iron ore":
                image = #imageLiteral(resourceName: "128px-Iron_Ore")
            case "screw":
                image = #imageLiteral(resourceName: "128px-Screw")
            case "reinforced iron plate":
                image = #imageLiteral(resourceName: "128px-Reinforced_Iron_Plate")
            default:
                image = #imageLiteral(resourceName: "1160358")
            }
            
            let input = i.value["input_min"] as! Float
            let output = i.value["output_min"] as! Float
            let ingredient = Ingredient(image: image, name: i.key.capitalized, input: input, calculatedInput: String(format: "%.1f/min : %.2f%%", input, (input / output) * 100), output: output, type: i.value["type"] as! String)
            self.ingredients.append(ingredient)
        }
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ingredient = ingredients[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell") as! IngredientCell
        
        cell.setIngredient(ingredient: ingredient)
        
        return cell
    }
    
    @IBAction func calculate(_ sender: Any) {
        if let input = Float(outputInputField.text!) {
            let clockPercentage = input / Float(component.output)
            
            for ingredient in ingredients {
                let calculatedInput = ingredient.input * clockPercentage
                
                ingredient.calculatedInput = String(format: "%.1f/min : %.2f%%", calculatedInput, (calculatedInput / ingredient.output) * 100)
                self.clockSpeedLabel.text = String(format: "%.2f%%", clockPercentage * 100)
                self.tableView.reloadData()
            }
        }
    }
}
