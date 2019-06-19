//
//  ResourceListView.swift
//  Exam Project
//
//  Created by admin on 18/06/2019.
//  Copyright © 2019 KEA. All rights reserved.
//

import UIKit
import Firebase

class ResourceListView: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var resources: [Resource] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchFromFirebase()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func fetchFromFirebase() {
        let colRef = Firestore.firestore().collection("resources")
        colRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("Failed to fetch data from Firestore: ", error)
            } else {
                for document in snapshot!.documents {
                    var image: UIImage
                    
                    switch document.documentID {
                    case "iron ore":
                        image = #imageLiteral(resourceName: "128px-Iron_Ore")
                    default:
                        image = #imageLiteral(resourceName: "1160358")
                    }
                    
                    let resource = Resource(image: image, name: document.documentID.capitalized)
                    self.resources.append(resource)
                }
                
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resource = self.resources[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "resourceCell") as! ResourceCell
        
        cell.setResource(resource: resource)
        
        return cell
    }

}
