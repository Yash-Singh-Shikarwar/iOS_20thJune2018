//
//  NewViewController.swift
//  CollectionViewDemoJuly13
//
//  Created by Yash Singh on 7/13/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    let mycollectionViewID: String = "CollectionViewidentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let xibcell = UINib(nibName: String(describing: MyNewCollectionViewCell.self), bundle: nil)
        collectionViewOutlet.register(xibcell, forCellWithReuseIdentifier: mycollectionViewID)
        
        // Do any additional setup after loading the view.
    }
    
    

//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
extension NewViewController: UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mycollectionViewID, for: indexPath) //as? MyNewCollectionViewCell
        
        return cell //!

   }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = 10
        return UIEdgeInsetsMake(CGFloat(inset), CGFloat(inset), CGFloat(inset), CGFloat(inset))
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return (UIScreen.main.bounds.size)
    }
    
    
    
}



