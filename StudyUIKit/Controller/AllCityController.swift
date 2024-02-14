//
//  AllCityController.swift
//  StudyUIKit
//
//  Created by iHRomnik on 13.02.2024.
//

import UIKit

class AllCityController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        
        didSet {
            tableView.dataSource = self
        }
    }
    
    @IBOutlet weak var labelTest: UILabel!
    
    var labelText: String = ""
    
    let cities: [City] = [
        City(image: UIImage(named: "axe"), name: "Moscov"),
        City(image: UIImage(named: "bat"),name: "Kyiv"),
        City(image: UIImage(named: "eye"),name: "London"),
        City(image: UIImage(named: "grave"),name: "Minsk"),
        City(image: UIImage(named: "gun"),name: "Riga"),
        City(image: UIImage(named: "jason"),name: "Vas"),
        City(image: UIImage(named: "skull"),name: "Kov")
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTest.text = labelText

        // Do any additional setup after loading the view.
    }
    

    
    
    
    
    /*ex
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension AllCityController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "AllCityCell", for: indexPath) as? AllCityCell else {
            preconditionFailure("error cell allCiry")
        }
        
        cell.labelAllCityCell.text = cities[indexPath.row].name
        cell.imageAllCityCell.image = cities[indexPath.row].image
//        var content = cell.defaultContentConfiguration()
//        content.text = cities[indexPath.row].name
//        content.image = cities[indexPath.row].image
//        cell.contentConfiguration = content
        
        return cell
        
    }
    
    
}
