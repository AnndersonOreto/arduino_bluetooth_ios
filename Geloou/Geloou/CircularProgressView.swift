//
//  CircularProgressView.swift
//  Geloou
//
//  Created by Anderson on 05/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import UIKit

class CircularProgressView: UIView {
    
    // MARK: - Public properties
    
    /// Set the progress bar's color.
    public var progressBarColor = UIColor.init(red: 32/255, green: 195/255, blue: 208/255, alpha: 1).cgColor
    
    /// Color the track that is behind the progress bar.
    public var trackingBarColor = UIColor.init(red: 185/255, green: 232/255, blue: 234/255, alpha: 1).cgColor
    
    /// Set  the color of the pulsing circle  that is envolving the main circle and the progress bar.
    public var pulsingColor = UIColor.init(red: 134/255, green: 214/255, blue: 216/255, alpha: 0.7).cgColor
    
    /// The central area of the circular progress view is set wirh this color.
    public var circularBackgroundColor = UIColor.white.cgColor
    
    /// The circular central area layer of the progress view.
    public let centralAreaLayer = CAShapeLayer()
    
    
    // MARK: - Private properties
    
    private var pulsatingLayer: CAShapeLayer!
    
    private var radius: CGFloat = 0.0
    
    private let progressContainer: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var progressBarLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        return layer
    }()
    
    
    // MARK: - Init method
    
    /// Inform the radius of the circular progress view
    init(radius: CGFloat) {
        self.radius = radius * 0.75
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        addSubview(progressContainer)
        progressContainer.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        progressContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        progressContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        progressContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        
        let circularPath = UIBezierPath(arcCenter: .zero,
                                        radius: radius,
                                        startAngle: 0,
                                        endAngle: 2 * CGFloat.pi,
                                        clockwise: true)
        
        pulsatingLayer = CAShapeLayer()
        pulsatingLayer.path = circularPath.cgPath
        pulsatingLayer.strokeColor = UIColor.clear.cgColor
        pulsatingLayer.lineWidth = 10
        //pulsatingLayer.fillColor = pulsingColor
        pulsatingLayer.position = center
        progressContainer.layer.addSublayer(pulsatingLayer)
        
        // Start animation of outer pulsing circle
        animatePulsatingLayer()
        
        centralAreaLayer.path = circularPath.cgPath
        centralAreaLayer.strokeColor = trackingBarColor
        centralAreaLayer.lineWidth = 10
        //centralAreaLayer.fillColor = circularBackgroundColor
        centralAreaLayer.position = center
        progressContainer.layer.addSublayer(centralAreaLayer)
        
        progressBarLayer.path = circularPath.cgPath
        progressBarLayer.strokeColor = progressBarColor
        progressBarLayer.lineWidth = 10
        progressBarLayer.lineCap = .round
        progressBarLayer.fillColor = UIColor.clear.cgColor
        progressBarLayer.position = center
        progressBarLayer.strokeEnd = 0 // how many in porcentage is completed (0.0 to 1). CGFloat
        progressBarLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1) // rotate -90 degrees
        progressContainer.layer.addSublayer(progressBarLayer)
                        
    }
    
    // MARK: - Progress Bar animation methods
    
    /// Start  animation of the circle progress bar at o'clock position.
    public func startProgressBarAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        progressBarLayer.strokeEnd = 0 // start on o'clock position. How many in porcentage is completed (0.0 to 1). CGFloat
        basicAnimation.toValue = 1
        basicAnimation.duration = 2 //in seconds
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        progressBarLayer.add(basicAnimation, forKey: "doAnimation")
        
    }
    
    /// Remove progress bar animation.
    public func stopProgressBarAnimation() {
        progressBarLayer.removeAnimation(forKey: "doAnimation")
    }
    
    // MARK: - Pulsing circle animation methods
    
    func animatePulsatingLayer() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        pulsatingLayer.fillColor = pulsingColor
        
        animation.toValue = 1.25
        animation.duration = 1
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        pulsatingLayer.add(animation, forKey: "pulsingLayer")
    }
}
