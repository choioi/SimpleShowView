//
//  ViewController2.swift
//  PhungPod
//
//  Created by Phung Du on 7/22/17.
//  Copyright © 2017 Phung Du. All rights reserved.
//

import UIKit
import SimpleShowView

class ViewController2: UIViewController, popupOverViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.showAnimate()
    }
    
    @IBAction func hidePOPUP(_ sender: Any) {
        self.removeAnimate()
    }
    
    func doneRemove() {
        print("done remove")
    }
    
    deinit {
        print("done remove deinit")
    }

    
}
