//
//  SheduleViewController.swift
//  Page
//
//  Created by Edward Mtshweni on 2018/06/13.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import UIKit

class SheduleViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    internal var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var name: String? {
        didSet {
            label.text = name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
