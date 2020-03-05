//
//  ViewController.swift
//  Geloou
//
//  Created by Anderson on 05/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let iceColor = UIColor.init(red: 32/255, green: 195/255, blue: 208/255, alpha: 1).cgColor
    let trackLayerColor = UIColor.init(red: 185/255, green: 232/255, blue: 234/255, alpha: 1).cgColor
    let pulsingColor = UIColor.init(red: 134/255, green: 214/255, blue: 216/255, alpha: 0.7).cgColor
    let circularBackgroundColor = UIColor.white.cgColor
    
    lazy var shapeLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        
        
        
        
        return layer
    }()
    
    var pulsatingLayer: CAShapeLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero,
                                        radius: 100,
                                        startAngle: 0,
                                        endAngle: 2 * CGFloat.pi,
                                        clockwise: true)
        
        pulsatingLayer = CAShapeLayer()
        pulsatingLayer.path = circularPath.cgPath
        pulsatingLayer.strokeColor = UIColor.clear.cgColor
        pulsatingLayer.lineWidth = 10
        pulsatingLayer.fillColor = pulsingColor
        pulsatingLayer.position = view.center
        view.layer.addSublayer(pulsatingLayer)
        animatePulsatingLayer()
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = trackLayerColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = circularBackgroundColor
        trackLayer.position = view.center
        view.layer.addSublayer(trackLayer)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = iceColor
        shapeLayer.lineWidth = 10
        shapeLayer.lineCap = .round
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.position = view.center
        shapeLayer.strokeEnd = 0 // how many in porcentage is completed (0.0 to 1). CGFloat
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1) // rotate -90 degrees
        view.layer.addSublayer(shapeLayer)
  
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        
    }

    fileprivate func startCircleAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        shapeLayer.strokeEnd = 0 // start on o'clock position. How many in porcentage is completed (0.0 to 1). CGFloat
        basicAnimation.toValue = 1
        basicAnimation.duration = 2 //in seconds
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "doAnimation")
    }
    
    @objc private func handleTap() {
        startCircleAnimation()
    }

    func animatePulsatingLayer() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 1.25
        animation.duration = 1
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        pulsatingLayer.add(animation, forKey: "pulsingLayer")
    }
}

