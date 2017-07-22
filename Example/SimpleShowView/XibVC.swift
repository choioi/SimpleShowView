//
//  XibVC.swift
//  PhungPod
//
//  Created by Phung Du on 7/22/17.
//  Copyright © 2017 Phung Du. All rights reserved.
//

import UIKit
import SimpleShowView

class XibVC: UIViewController, popupOverViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.showAnimate()
        
    }

    @IBAction func hidePOPUP(_ sender: UIButton) {
        self.removeAnimate()
    }
    
    
    
    func doneRemove() {
        print("Done remove hehehe")
    }
    deinit {
        print("Done deinit")
    }
   

}
