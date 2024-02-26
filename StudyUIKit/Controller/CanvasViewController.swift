//
//  CanvasViewController.swift
//  StudyUIKit
//
//  Created by iHRomnik on 22.02.2024.
//

import UIKit

class CanvasViewController: UIViewController {
    
    
    @IBOutlet weak var drawningContriller: DrawningControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        drawningContriller.addTarget(self, action: #selector(drawControlChenge), for: .valueChanged)
        // Do any additional setup after loading the view.
    }
    
    @objc func drawControlChenge() {
        drawningContriller.setNeedsDisplay()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
