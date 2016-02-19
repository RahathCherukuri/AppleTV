//
//  SearchController.swift
//  UIKitCatalog
//
//  Created by Rahath cherukuri on 2/18/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class SearchController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionVFL: UICollectionViewFlowLayout!
    
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var collectionVFL1: UICollectionViewFlowLayout!

    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var collectionVFL2: UICollectionViewFlowLayout!
    
    @IBOutlet weak var collectionView3: UICollectionView!
    @IBOutlet weak var collectionVFL3: UICollectionViewFlowLayout!
    
    static let storyboardIdentifier = "SearchController"
    
    private let cellComposer = DataItemCellComposer()
    
    private let allDataItems = DataItem.sampleItems
    
    private var filteredDataItems = DataItem.sampleItems
    
    var filterString = "" {
        didSet {
            // Return if the filter string hasn't changed.
            guard filterString != oldValue else { return }
            
            // Apply the filter or show all items if the filter string is empty.
            if filterString.isEmpty {
                filteredDataItems = allDataItems
            }
            else {
                filteredDataItems = allDataItems.filter { $0.title.localizedStandardContainsString(filterString) }
            }
            
            // Reload the collection view to reflect the changes.
            collectionView?.reloadData()
            collectionView1?.reloadData()
            collectionView2?.reloadData()
            collectionView3?.reloadData()
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        if ((collectionVFL1) != nil) {
            self.collectionVFL1.scrollDirection = UICollectionViewScrollDirection.Horizontal
                self.collectionVFL.minimumInteritemSpacing = 3.0
        }
        if ((collectionVFL2) != nil) {
            self.collectionVFL2.scrollDirection = UICollectionViewScrollDirection.Horizontal
            self.collectionVFL.minimumInteritemSpacing = 3.0
        }
        if ((collectionVFL3) != nil) {
            self.collectionVFL3.scrollDirection = UICollectionViewScrollDirection.Horizontal
            self.collectionVFL.minimumInteritemSpacing = 3.0
        }
        if ((collectionVFL) != nil) {
            self.collectionVFL.scrollDirection = UICollectionViewScrollDirection.Horizontal
            self.collectionVFL.minimumInteritemSpacing = 8.0
            self.collectionVFL.minimumLineSpacing = 5.0
        }
    }
    
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredDataItems.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // Dequeue a cell from the collection view.
        return collectionView.dequeueReusableCellWithReuseIdentifier(DataItemCollectionViewCell.reuseIdentifier, forIndexPath: indexPath)
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        guard let cell = cell as? DataItemCollectionViewCell else { fatalError("Expected to display a `DataItemCollectionViewCell`.") }
        let item = filteredDataItems[indexPath.row]
        
        // Configure the cell.
        cellComposer.composeCell(cell, withDataItem: item)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
