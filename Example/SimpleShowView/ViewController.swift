//
//  ViewController.swift
//  PhungPod
//
//  Created by Phung Du on 7/22/17.
//  Copyright © 2017 Phung Du. All rights reserved.
//

import UIKit
import SimpleShowView
class ViewController: UIViewController {

    @IBOutlet weak var viewHolder: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func show(_ sender: Any) {
       viewHolder.showXib(with: XIB1())
    }

    @IBAction func hide(_ sender: Any) {
        viewHolder.hideXib()
    }
    @IBAction func showMin(_ sender: Any) {
        viewHolder.showXibMinimize(heightMustHide: 100)
    }
    @IBAction func showMax(_ sender: Any) {
        viewHolder.showXibMaximize()
    }

    @IBAction func showPopup(_ sender: Any) {
        //let popupVC = XibVC.loadFromNib()
        
        let popupVC = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        showPopup(vc: popupVC)
    }
    
    @IBAction func showXibVC(_ sender: Any) {
        let popupVC:XibVC  = XibVC.loadFromNib()
        showPopup(vc: popupVC)
        
    }
    
}

