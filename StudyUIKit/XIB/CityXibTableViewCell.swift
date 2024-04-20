//
//  CityXibTableViewCell.swift
//  StudyUIKit
//
//  Created by iHRomnik on 19.03.2024.
//

import UIKit

class CityXibTableViewCell: UITableViewCell {

    @IBOutlet weak var cityImage: UIImageView!
    
    @IBOutlet weak var cityLabel: UILabel!
    
   static let identity = "cityXib"
    static  let nibName = "CityXibTableViewCell"
    
    func configure(imageName: UIImage, labelText: String) {
        cityLabel.text = labelText
        cityImage.image = imageName
    }
}
