//
//  ComponentListView.swift
//  Exam Project
//
//  Created by admin on 16/06/2019.
//  Copyright © 2019 KEA. All rights reserved.
//

import UIKit
import Firebase

class ComponentListView: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var components: [Component] = []
    var index: Int = -1
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchFromFirebase()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func fetchFromFirebase() {
        let colRef = Firestore.firestore().collection("components")
        colRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("Failed to fetch data from Firestore: ", error)
            } else {
                for document in snapshot!.documents {
                    var image: UIImage
                    
                    switch document.documentID {
                    case "iron ingot":
                        image = #imageLiteral(resourceName: "128px-Iron_Ingot")
                    case "iron rod":
                        image = #imageLiteral(resourceName: "128px-Iron_Rod")
                    case "iron plate":
                        image = #imageLiteral(resourceName: "128px-Iron_Plate")
                    case "screw":
                        image = #imageLiteral(resourceName: "128px-Screw")
                    case "reinforced iron plate":
                        image = #imageLiteral(resourceName: "128px-Reinforced_Iron_Plate")
                    default:
                        image = #imageLiteral(resourceName: "1160358")
                    }
                    
                    let component = Component(image: image, name: document.documentID.capitalized, building: document.data()["building"] as! String, output: document.data()["output_min"] as! Float, ingredients: document.data()["ingredients"] as! Dictionary<String, Dictionary<String, Any>>)
                    self.components.append(component)
                }
                
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.components.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let component = self.components[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "componentCell") as! ComponentCell
        
        cell.setComponent(component: component)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        performSegue(withIdentifier: "segueCompCalc", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CalculatorView {
            destination.component = self.components[self.index]
        }
    }
}

extension String {
    func printHello() {
        print("Hello\(self)")
    }
}
