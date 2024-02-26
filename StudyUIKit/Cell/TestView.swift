//
//  TestView.swift
//  StudyUIKit
//
//  Created by iHRomnik on 22.02.2024.
//

import UIKit

class TestView: UIView {


    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        context.setFillColor(UIColor.green.cgColor)
        
        let rectanglen = CGRect(x: 0, y: 0, width: 100, height: 100)
        context.fill(rectanglen)
        
        context.move(to: CGPoint(x: rect.width/2, y: rect.height/2))
        context.addLine(to: CGPoint(x: rect.width, y: rect.height/2))
        context.addLine(to: CGPoint(x: rect.width, y: rect.height))
        context.closePath()
        context.setStrokeColor(UIColor.yellow.cgColor)
        context.setLineWidth(5)
        context.strokePath()
//        context.fillPath()
        
        
        
        let triangle = UIBezierPath()
        triangle.move(to: CGPoint(x: 0, y: rect.height/2))
        triangle.addLine(to: CGPoint(x: 0, y: rect.height))
        triangle.addLine(to: CGPoint(x: rect.height/2, y: rect.height))
        triangle.close()
        UIColor.green.setFill()
        triangle.fill()
//        UIColor.green.setStroke()
//        triangle.stroke()
        
//        context.addPath(triangle.cgPath)
//        context.setFillColor(UIColor.yellow.cgColor)
//        context.fillPath()
    }
    
  
   

}
