//
//  CalenderViewController.swift
//  H.O.M.E
//
//  Created by Ken Lim on 09/05/2017.
//  Copyright © 2017 Ken. All rights reserved.
//

import UIKit

class CalenderViewController: UIViewController {
    
    // Variables from segue
    var testText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = testText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
