//
//  BuildingCell.swift
//  Exam Project
//
//  Created by admin on 18/06/2019.
//  Copyright © 2019 KEA. All rights reserved.
//

import UIKit

class BuildingCell: UITableViewCell {
    
    @IBOutlet weak var buildingImageView: UIImageView!
    @IBOutlet weak var buildingLabel: UILabel!
    
    func setBuilding(building: Building) {
        buildingImageView.image = building.image
        buildingLabel.text = building.name
    }
    
}
