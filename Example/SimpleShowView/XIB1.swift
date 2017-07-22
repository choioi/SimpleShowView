//
//  XIB1.swift
//  testSwiftMEssage
//
//  Created by Phung Du on 7/22/17.
//  Copyright © 2017 Phung Du. All rights reserved.
//  

import UIKit

class XIB1: UIView {
    var i = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
        // The Main Stuff
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
        // You don't need to implement this
    }
    
    func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "XIB1", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.addSubview(view);
        
        i += 1
        print(i)
    }
    deinit {
        print("was deinit XIB1")
    }

}
