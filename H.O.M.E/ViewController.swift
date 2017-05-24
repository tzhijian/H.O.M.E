//
//  ViewController.swift
//  H.O.M.E
//
//  Created by Ken Lim on 08/05/2017.
//  Copyright © 2017 Ken. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    var indexPathRow : Int = 0
    var timer = Timer()
    let reuseIdentifier = "cell"
    let items = ["Clock in/out","Calendar","Lazy Door","3D Printer Monitoring","Stock List","Progress checker"]
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dateLabel.text = Date().toString()
        menuCollectionView.backgroundColor = UIColor.clear
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MenuCollectionViewCell
        
        cell.cellLabel.text = items[indexPath.item]
        cell.backgroundColor = UIColor.cyan
        cell.layer.borderWidth = 2.0
        cell.bounds.size.width = 150
        cell.bounds.size.height = 150
        cell.layer.cornerRadius = cell.bounds.size.width/2
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexPathRow = indexPath.row
        switch (indexPathRow) {
        case 0:
            self.performSegue(withIdentifier: "showCheckIn", sender: self)
        case 1:
            self.performSegue(withIdentifier: "showCalender", sender: self)
        case 2:
            self.performSegue(withIdentifier: "showLazyDoor", sender: self)
        case 3:
            self.performSegue(withIdentifier: "showPrinter", sender: self)
        default:
            break
        }
    }
    
    @objc func tick() {
        timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier)! {
        case "showCheckIn":
            let destVC = segue.destination as! CheckInViewController
            destVC.testText = items[indexPathRow]
        case "showCalender":
            let destVC = segue.destination as! CalenderViewController
            destVC.testText = items[indexPathRow]
        case "showLazyDoor":
            let destVC = segue.destination as! LazyDoorViewController
            destVC.testText = items[indexPathRow]
        case "showPrinter":
            let destVC = segue.destination as! PrinterViewController
            destVC.testText = items[indexPathRow]
        default:
            break
        }
    }
}

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE\nd MMM, yyyy"
        return dateFormatter.string(from: self)
    }
}
