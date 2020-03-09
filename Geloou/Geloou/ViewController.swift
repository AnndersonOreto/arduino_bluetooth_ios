//
//  ViewController.swift
//  Geloou
//
//  Created by Anderson on 05/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    var circularProgressView: CircularProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        circularProgressView = CircularProgressView(radius: containerView.frame.height / 2 )
        circularProgressView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(circularProgressView)
        
        setCircularProgressConstraints()
        
        circularProgressView.centralAreaLayer.fillColor = UIColor.red.cgColor
        
    }
    
    fileprivate func setCircularProgressConstraints() {
        circularProgressView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        circularProgressView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        circularProgressView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        circularProgressView.heightAnchor.constraint(equalTo: containerView.heightAnchor,multiplier: 1).isActive = true
        circularProgressView.widthAnchor.constraint(equalTo: containerView.widthAnchor,multiplier: 1).isActive = true
    }
}

