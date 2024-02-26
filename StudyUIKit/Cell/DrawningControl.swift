//
//  DrawningControl.swift
//  StudyUIKit
//
//  Created by iHRomnik on 22.02.2024.
//

import UIKit

//@IBDesignable

class DrawningControl: UIControl {

    @IBInspectable  var isToggle: Bool = true
    
    @IBOutlet var svitchView: UISwitch! {
        didSet {
            svitchView.isOn = isToggle
        }
    }
    
    @IBAction func switchPress(_ sender: Any) {
        isToggle.toggle()
        sendActions(for: .valueChanged)
    }
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {return}
        let colorOne: CGColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
        let colorRed: UIColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        
        context.setFillColor(colorRed.cgColor)
        
        if isToggle {
            
            let rectangle = CGRect(x: 50, y: 50, width: rect.width/4, height: rect.height/4)
            context.fill(rectangle)
        }
        
        context.move(to: CGPoint(x: rect.width/2, y: rect.height/2))
        context.addLine(to: CGPoint(x: rect.width, y: rect.height/2))
        context.addLine(to: CGPoint(x: rect.width, y: rect.height))
        context.closePath()
        context.setStrokeColor(colorOne)
        context.setLineWidth(5)
        context.strokePath()
//        context.fillPath()
        
        
        let triangle = UIBezierPath()
        triangle.move(to: CGPoint(x: 0, y: rect.height/2))
        triangle.addLine(to: CGPoint(x: 0, y: rect.height))
        triangle.addLine(to: CGPoint(x: rect.height/2, y: rect.height))
        triangle.close()
        
        context.addPath(triangle.cgPath)
        context.setFillColor(UIColor.green.cgColor)
        context.fillPath()
//        context.setStrokeColor(UIColor.black.cgColor)
//        context.strokePath()
        
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 10
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGesture()
        setupSwipe()
    }
    
    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        setupGesture()
        setupSwipe()
        
    }
    

    func setupGesture() {
        let doungleTap = UITapGestureRecognizer(target: self, action: #selector(tapDouble))
        doungleTap.numberOfTapsRequired = 2
        addGestureRecognizer(doungleTap)
    }
    
    func setupSwipe() {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipe.direction = .right
        addGestureRecognizer(swipe)
    }
    @objc func swipe() {
        print("Swipe")
    }
    
    @objc func tapDouble(_ tap: UITapGestureRecognizer) {
        print("Tap")
        isToggle.toggle()
        svitchView.isOn = isToggle
        
        
        sendActions(for: .valueChanged)
        
    }
    
}
