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
        City(image: UIImage(named: "City/axe"), name: "Moscov"),
        City(image: UIImage(named: "City/bat"), name: "Kyiv"),
        City(image: UIImage(named: "City/grave"), name: "Zask"),
        City(image: UIImage(named: "City/voodoo"), name: "Luo"),
        City(image: UIImage(named: "City/bat"), name: "Gav"),
        City(image: UIImage(named: "City/skull"), name: "Kyiv"),
        City(image: UIImage(named: "City/grave"), name: "Kyiv"),
        City(image: UIImage(named: "City/voodoo"), name: "Tik"),
        City(image: UIImage(named: "City/bat"), name: "Mol"),
        City(image: UIImage(named: "City/grave"), name: "Slav"),
        City(image: UIImage(named: "City/jason"), name: "Koli"),
        City(image: UIImage(named: "City/eye"), name: "London"),
        City(image: UIImage(named: "City/grave"), name: "Minsk"),
        City(image: UIImage(named: "City/gun"), name: "Riga"),
        City(image: UIImage(named: "City/voodoo"), name: "Vas"),
        City(image: UIImage(named: "City/sgrave"), name: "Kov"),
        City(image: UIImage(named: "City/grave"), name: "Double"),
    
    ]
    var sortedCity = [Character : [City]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTest.text = labelText
        self.sortedCity = sort(cities: cities)
        
        tableView.register(UINib(nibName: CityXibTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: CityXibTableViewCell.identity)

        // Do any additional setup after loading the view.
    }
    
    private func sort(cities: [City]) -> [Character : [City]] {
        
        var citiesTemp = [Character : [City]]()
        
        cities.forEach() { city in
            guard let firstChar = city.name.first else {return}
            if var thisCharCities = citiesTemp[firstChar] {
                thisCharCities.append(city)
                citiesTemp[firstChar] = thisCharCities
            } else {
                citiesTemp[firstChar] = [city]
            }
        }
        
        
        return citiesTemp
        
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
    func numberOfSections(in tableView: UITableView) -> Int {
        sortedCity.keys.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sortedCity.keys.sorted()[section])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keySorted = sortedCity.keys.sorted()
        let citiesCount = sortedCity[keySorted[section]]?.count ?? 0
        return citiesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: CityXibTableViewCell.identity, for: indexPath) as? CityXibTableViewCell else {
            preconditionFailure("error cell allCiry")
        }
        
        let firstCharSection = sortedCity.keys.sorted()[indexPath.section]
             let citiesInSection = sortedCity[firstCharSection]!
        
        
//        let cities = citiesInSection[indexPath.row]
        
//        cell.cityLabel.text = city.name
//        cell.cityImage.image = city.image
        
        cell.configure(imageName: citiesInSection[indexPath.row].image ?? UIImage(systemName: "eraser")!, labelText: citiesInSection[indexPath.row].name)
        
//        cell.labelAllCityCell.text = cities[indexPath.row].name
//        cell.imageAllCityCell.image = cities[indexPath.row].image
//        var content = cell.defaultContentConfiguration()
//        content.text = cities[indexPath.row].name
//        content.image = cities[indexPath.row].image
//        cell.contentConfiguration = content
        
        return cell
        
    }
    
    
    
    
}
