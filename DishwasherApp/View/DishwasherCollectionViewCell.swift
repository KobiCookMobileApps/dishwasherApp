//
//  DishwasherCollectionViewCell.swift
//  DishwasherApp
//
//  Created by Admin on 5/14/18.
//  Copyright © 2018 mobileappscompany. All rights reserved.
//

import UIKit

class DishwasherCollectionViewCell: UICollectionViewCell {
    
    
    
    static let identifier = "DishwasherCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1.0
    }
    
    
    func configure(with dishwasher: Dishwasher) {
        titleLabel.text = dishwasher.title
        priceLabel.text = "00.00"
        
        DispatchQueue.global(qos: .userInitiated).async {
            let url = URL(string: "https:" + dishwasher.image)
            guard let data = try? Data(contentsOf: url!) else {
                return
            }
            let imageData = UIImage(data: data)
            
            DispatchQueue.main.async {
                self.imageView.image = imageData
            }
        }
       
        
    }

    }


