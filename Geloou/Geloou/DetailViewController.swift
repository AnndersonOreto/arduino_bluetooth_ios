//
//  DetailViewController.swift
//  Geloou
//
//  Created by Vitor Demenighi on 09/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var drinkTitle: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = drinkTitle
    }

}
