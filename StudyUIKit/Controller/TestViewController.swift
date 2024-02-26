//
//  TestViewController.swift
//  StudyUIKit
//
//  Created by iHRomnik on 22.02.2024.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var testView: TestView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testView.layer.borderWidth = 5
        testView.layer.borderColor = UIColor.black.cgColor
        testView.layer.cornerRadius = 20
        testView.layer.shadowColor = UIColor.blue.cgColor
        testView.layer.shadowOpacity = 0.5
        testView.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        
//        let maskLayer = CAShapeLayer()
//        let figure = UIBezierPath()
//        figure.move(to: CGPoint(x: 150, y: 150))
//        figure.addLine(to: CGPoint(x: 150, y: 300))
//        figure.addLine(to: CGPoint(x: 300, y: 300))
//        figure.addLine(to: CGPoint(x: 300, y: 150))
//        figure.close()
//        figure.stroke()
//        maskLayer.path = figure.cgPath
//        testView.layer.mask = maskLayer
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        testView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4).concatenating(CGAffineTransform(scaleX: 0.5, y: 0.5))
//        testView.transform = .identity
        
    }

}
