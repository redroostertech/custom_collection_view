//
//  ViewController.swift
//  Gumbo
//
//  Created by Michael Westbrooks II on 6/8/18.
//  Copyright © 2018 RedRooster Technologies. All rights reserved.
//

import UIKit

class ExperienceNewArtistsViewController:
    UIViewController,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var mainTbl: UICollectionView!
    var mainTblViewLayout: UICollectionViewFlowLayout!
    var colors: [UIColor] = [.red, .green, .blue, .cyan]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.clipsToBounds = true
        titleLbl.layer.cornerRadius = titleLbl.frame.height / 2
        titleLbl.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        
        mainTbl.delegate = self
        mainTbl.dataSource = self
        
        mainTblViewLayout = UICollectionViewFlowLayout()
        mainTblViewLayout.itemSize = CGSize(width: self.view.frame.width,
                                            height: self.view.frame.height)
        mainTblViewLayout.scrollDirection = .horizontal
        mainTblViewLayout.minimumInteritemSpacing = 0.0
        mainTblViewLayout.minimumLineSpacing = 0.0
        
        mainTbl.setCollectionViewLayout(mainTblViewLayout, animated: true)
        mainTbl.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExperienceNewArtistsCell", for: indexPath)
        let color = colors[indexPath.row]
        cell.backgroundColor = color
        return cell
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        snapToNearestCell(self.mainTbl)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        snapToNearestCell(self.mainTbl)
    }
    
    func snapToNearestCell(_ collectionView: UICollectionView) {
        for i in 0..<collectionView.numberOfItems(inSection: 0) {
            
            let itemWithSpaceWidth = self.mainTblViewLayout.itemSize.width + mainTblViewLayout.minimumLineSpacing
            let itemWidth = self.mainTblViewLayout.itemSize.width
            
            if collectionView.contentOffset.x <= CGFloat(i) * itemWithSpaceWidth + itemWidth / 2 {
                let indexPath = IndexPath(item: i, section: 0)
                collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                break
            }
        }
    }
    
}
