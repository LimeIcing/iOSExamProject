//
//  BuildingListView.swift
//  Exam Project
//
//  Created by admin on 18/06/2019.
//  Copyright © 2019 KEA. All rights reserved.
//

import UIKit
import Firebase

class BuildingListView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var buildings: [Building] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchFromFirebase()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func fetchFromFirebase() {
        let colRef = Firestore.firestore().collection("buildings")
        colRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("Failed to fetch data from Firestore: ", error)
            } else {
                for document in snapshot!.documents {
                    var image: UIImage
                    
                    switch document.documentID {
                    case "smelter":
                        image = #imageLiteral(resourceName: "128px-Smelter")
                    case "constructor":
                        image = #imageLiteral(resourceName: "128px-Constructor")
                    case "assembler":
                        image = #imageLiteral(resourceName: "128px-Assembler")
                    case "miner":
                        image = #imageLiteral(resourceName: "128px-Miner_Mk.1")
                    default:
                        image = #imageLiteral(resourceName: "1160358")
                    }
                    
                    let building = Building(image: image, name: document.documentID.capitalized)
                    self.buildings.append(building)
                }
                
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.buildings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let building = self.buildings[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "buildingCell") as! BuildingCell
        
        cell.setBuilding(building: building)
        
        return cell
    }
    
}
