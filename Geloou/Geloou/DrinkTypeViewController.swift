//
//  DrinkTypeViewController.swift
//  Geloou
//
//  Created by Vitor Demenighi on 09/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import UIKit

class DrinkTypeViewController: UIViewController {

    var drinkSelectedAndAmount: (String, [String]) = ("",[])
    var drinkSelected: (String, String) = ("", "")
    
    var drinksArray = ["Lata", "Garrafa"]
    
    
    @IBOutlet weak var drinkTypeTableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drinkTypeTableview.dataSource = self
        drinkTypeTableview.delegate = self
//        descriptionLabel.text = "Qual o tipo de \(drinkSelectedAndAmount.0.lowercased()) você deseja gelar?"
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "temperatureSegue" {
            if let nextViewController = segue.destination as? TemperatureViewController {
                nextViewController.drinkSelected = drinkSelected
            }
        }
    }
    
}

extension DrinkTypeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell") as? DrinksListCell else { return UITableViewCell()
        }
//        cell?.textLabel?.text = drinkSelectedAndAmount.1[indexPath.row]
        
        
        if indexPath.row == 0 {
            cell.drinkNameLabel.text = drinksArray[0]
            cell.drinkImage.image = UIImage(named: "cerveja_lata")
//            cell.backgroundColor = UIColor(red: 255/255, green: 200/255, blue: 0/255, alpha: 1)
            cell.backgroundColor = UIColor(red: 255/255, green: 166/255, blue: 0/255, alpha: 0.7)

        } else if indexPath.row == 1 {
            cell.drinkNameLabel.text = drinksArray[1]
            cell.drinkImage.image = UIImage(named: "cerveja_garrafa")
            cell.backgroundColor = UIColor(red: 255/255, green: 166/255, blue: 0/255, alpha: 0.9)

        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        drinkSelected = (drinkSelectedAndAmount.0, drinkSelectedAndAmount.1[indexPath.row])
        performSegue(withIdentifier: "temperatureSegue", sender: nil)
    }
    
    // FDE08D cor do background
    
}
