//
//  ResourceCell.swift
//  Exam Project
//
//  Created by admin on 18/06/2019.
//  Copyright © 2019 KEA. All rights reserved.
//

import UIKit

class ResourceCell: UITableViewCell {

    @IBOutlet weak var resourceImageView: UIImageView!
    @IBOutlet weak var resourceLabel: UILabel!
    
    func setResource(resource: Resource) {
        resourceImageView.image = resource.image
        resourceLabel.text = resource.name
    }

}
