//
//  HellaDetailViewController.swift
//  HellaCollectionCells
//
//  Created by Jacqueline Minneman on 10/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class HellaDetailViewController: UIViewController {
    
    var number: String?
    var fibSequence = [Int]()
    var intNumber: Int?
    
    @IBOutlet weak var detailLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        fibSequence = arrayWithFibonacciSequenceToIndex(index:17)
        
        if let number = number {
            intNumber = Int(number)
            if let intNumber = intNumber {
                
                self.detailLabel.text = "\(number)"
                self.view.backgroundColor = UIColor.green
                
                if fibSequence.contains(intNumber){
                    view.backgroundColor = UIColor.purple
                } else {
                    view.backgroundColor = UIColor.yellow
                }
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
