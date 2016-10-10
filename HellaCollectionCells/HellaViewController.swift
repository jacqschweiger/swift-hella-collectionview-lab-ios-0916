//
//  ViewController.swift
//  HellaCollectionCells
//
//  Created by Flatiron School on 10/6/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class HellaViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var fibSequence = [Int]()

    
        override func viewDidLoad() {
        super.viewDidLoad()
        fibSequence = arrayWithFibonacciSequenceToIndex(index:17)

            
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath) as! HellaCollectionViewCell
        cell.cellLabel.text = String(indexPath.row)
        
        if fibSequence.contains(indexPath.row) {
            cell.backgroundColor = UIColor.purple
        } else {
            cell.backgroundColor = UIColor.yellow
        }
      
        return cell
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("\nprepare for segue\n")
        if segue.identifier == "showDetail" {
            let destination = segue.destination as! HellaDetailViewController

            if let selectedIndexPath = collectionView.indexPathsForSelectedItems?[0].item{
                destination.number = "\(selectedIndexPath)"
            }
        }
    }
    
    
}



func arrayWithFibonacciSequenceToIndex(index: Int) -> [Int] {
    var fibArray: [Int] = [0, 1]
    let i = 0
    for i in i...index-2 {
        let newNum = fibArray[i] + fibArray[i+1]
        fibArray.append(newNum)
    }
    return fibArray
}




