//
//  ViewController.swift
//  DishwasherApp
//
//  Created by Admin on 5/14/18.
//  Copyright © 2018 mobileappscompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var products = [Dishwasher]()
    @IBOutlet weak var dishwasherCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProductService.getProducts { [unowned self] dishwashers in
            self.products = dishwashers
            DispatchQueue.main.async {
                self.dishwasherCollectionView.reloadData()
            }
        }
    }




}



extension ViewController: UICollectionViewDelegate {
    
    
}





extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 2, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}




extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishwasherCollectionViewCell.identifier, for: indexPath) as! DishwasherCollectionViewCell
        
        let dishwasher = products[indexPath.row]
        
        cell.configure(with: dishwasher)
        
        
        return cell
    }
    
    
    
}
