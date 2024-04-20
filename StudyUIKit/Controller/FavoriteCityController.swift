//
//  FavoriteCityController.swift
//  StudyUIKit
//
//  Created by iHRomnik on 13.02.2024.
//

import UIKit

class FavoriteCityController: UITableViewController {

    var cities: [City] = [
//        City(image: UIImage(named: "axe"), name: "Moscov"),
//        City(image: UIImage(named: "bat"),name: "Kyiv"),
//        City(image: UIImage(named: "eye"),name: "London"),
//        City(image: UIImage(named: "grave"),name: "Minsk"),
//        City(image: UIImage(named: "gun"),name: "Riga"),
//        City(image: UIImage(named: "jason"),name: "Vas"),
//        City(image: UIImage(named: "skul"),name: "Kov")
    
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: CityXibTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: CityXibTableViewCell.identity)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: CityXibTableViewCell.identity, for: indexPath) as? CityXibTableViewCell else {
            preconditionFailure("Cityes cannot")
        }
        
        cell.configure(imageName: cities[indexPath.row].image ?? UIImage(named: "voodoo")!, labelText: cities[indexPath.row].name)

//        cell.lableCityCell.text = cities[indexPath.row].name
//        cell.imageCityCell.image = cities[indexPath.row].image

        return cell
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FavoriteCities",
           let destinationVC = segue.destination as? ForecastController,
           let indexPath = tableView.indexPathForSelectedRow
        {
            let city = cities[indexPath.row].name
            destinationVC.title = city
        } else if segue.identifier == "AllCitiesSegue",
                  let destinationVC = segue.destination as? AllCityController {
            destinationVC.labelText = "someText"
        }
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "To_Forecast", sender: nil)
    }
    
    @IBAction func addSelectedCity(segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? AllCityController,
           let indexPath = sourceVC.tableView.indexPathForSelectedRow {
            let city = sourceVC.cities[indexPath.row]
            if !cities.contains(where: {$0.name == city.name}) {
                cities.append(city)
                tableView.reloadData()
            }
        }
//        print(segue.source)
//        print(segue.destination)
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
