//
//  ViewController.swift
//  RSCustomTabbar2
//
//  Created by rose on 24/02/2020.
//  Copyright © 2020 rose. All rights reserved.
//

import UIKit

class ViewController: RSCustomTabbarController {

    var view1:UIViewController = {
        let vc = UIViewController.init()
        vc.view.backgroundColor = UIColor.red
        return vc
    }()
    var view2:UIViewController = {
        let vc = UIViewController.init()
        vc.view.backgroundColor = UIColor.orange
        return vc
    }()
    var view3:UIViewController = {
        let vc = UIViewController.init()
        vc.view.backgroundColor = UIColor.yellow
        return vc
    }()
    var view4:UIViewController = {
        let vc = UIViewController.init()
        vc.view.backgroundColor = UIColor.green
        return vc
    }()
    var view5:UIViewController = {
        let vc = UIViewController.init()
        vc.view.backgroundColor = UIColor.blue
        return vc
    }()
    
    
    override func viewDidLoad() {
        
        // Do any additional setup after loading the view.
        self.viewItems = [view1, view2]
        self.tabItems = ["Tab1","Tab2"]
        
        super.viewDidLoad()
    }
}

