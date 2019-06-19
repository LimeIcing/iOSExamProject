//
//  ComponentCell.swift
//  Exam Project
//
//  Created by admin on 16/06/2019.
//  Copyright © 2019 KEA. All rights reserved.
//

import UIKit

class ComponentCell: UITableViewCell {

    @IBOutlet weak var componentImageView: UIImageView!
    @IBOutlet weak var componentLabel: UILabel!

    func setComponent(component: Component) {
        componentImageView.image = component.image
        componentLabel.text = component.name
    }
}
