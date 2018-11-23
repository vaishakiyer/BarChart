//
//  ViewController.swift
//  TestBarGraph
//
//  Created by Vaishak.Iyer on 23/11/18.
//  Copyright © 2018 Vaishak.Iyer. All rights reserved.
//

import UIKit


struct DataModel {
    
    var yValues : [CGFloat]?
    var xValues: [CGFloat]?
    var barHighlightColor: UIColor?
    
}

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    
    let values: [CGFloat] = [200, 300, 400, 500, 600, 700, 50, 20, 10,45,6,100,200,120]
    
    var barValues = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "BAR CHART"
        
        collectionView?.backgroundColor = .white
        
        collectionView?.register(BarCell.self, forCellWithReuseIdentifier: cellId)
        
        (collectionView?.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        
        
        addValueToChard(xVals: [0,1,2,3,4,5,6,7,8,9,10,11,12,13], yVals: values, highlightcolor: .green)
        
    }
    
    
    func addValueToChard(xVals: [CGFloat], yVals: [CGFloat], highlightcolor: UIColor){
        
        barValues.xValues = xVals
        barValues.yValues = yVals
        barValues.barHighlightColor = highlightcolor
        collectionView.reloadData()
    }
    
    
    func triggerWhenBarIsSelected(message: String){
        
        let displayString = "Coordinates:  (" + message + ")"
        
        let alertController = UIAlertController(title: "Bar Value", message: displayString, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return barValues.xValues!.count
    }
    
    func maxHeight() -> CGFloat {
        return view.frame.height - 20 - 44 - 8
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BarCell
        
        if let max = barValues.yValues!.max() {
            let value =  barValues.yValues![indexPath.item]
            let ratio = value / max
            
            cell.barHeightConstraint?.constant = maxHeight() * ratio
        }
        cell.barHighlightColor = barValues.barHighlightColor
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
         let val =   barValues.xValues![indexPath.row].description + " , " + barValues.yValues![indexPath.row].description
        
         triggerWhenBarIsSelected(message: val)
        
      
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 30, height: maxHeight())
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    }
    
}
