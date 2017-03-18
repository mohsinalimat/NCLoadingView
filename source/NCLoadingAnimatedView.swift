//
//  NCLoadingAnimatedView.swift
//  NCLoadingView
//
//  Created by LINAICAI on 2017/3/18.
//  Copyright © 2017年 LINAICAI. All rights reserved.
//

import UIKit

class NCLoadingAnimatedView: UIView {
    var maskLayer:CALayer = {
        let layer = CALayer()
        return layer
    }()
    var foregroundLayer:CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.lineWidth = 2.0
        layer.strokeColor = UIColor.red.cgColor
        layer.fillColor = nil
        layer.lineCap = kCALineCapButt
        layer.strokeEnd = 0.15;
        return layer
    }()
    var backgroundLayer:CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.lineWidth = 2.0
        layer.strokeColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0).cgColor
        layer.fillColor = nil
        layer.lineCap = kCALineCapButt
        layer.strokeEnd = 1.0;
        return layer
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.maskLayer.frame = bounds
        self.maskLayer.mask = self.backgroundLayer
        let path:UIBezierPath = UIBezierPath(ovalIn: bounds.insetBy(dx: 2, dy: 2))
        self.foregroundLayer.path = path.cgPath
        self.backgroundLayer.path = path.cgPath
        self.layer.addSublayer(self.backgroundLayer)
        self.layer.addSublayer(self.foregroundLayer)
        self.rotate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
    }
    func rotate() -> Void{
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = NSNumber(floatLiteral: Double.pi)
        animation.duration = 0.5
        animation.isCumulative = true
        animation.repeatCount = Float(Int.max)
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        self.layer.add(animation, forKey: "animation")
        //self.foregroundLayer.add(animation, forKey: "animation")
        //self.backgroundLayer.add(animation, forKey: "animation")
    }

}
