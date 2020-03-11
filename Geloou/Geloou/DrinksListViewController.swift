//
//  DrinksListViewController.swift
//  Geloou
//
//  Created by Vitor Demenighi on 09/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import UIKit

class DrinksListViewController: UIViewController {

    
    let drinks: [(String, [String])] =
        [("Cerveja", ["Lata","Latão","Garrafa"])]
    
    var drinkSelected: (String, [String]) = ("", [])
    
    @IBOutlet weak var drinksTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drinksTableView.dataSource = self
        drinksTableView.delegate = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectedDrinkSegue" {
            if let nextViewController = segue.destination as? DrinkTypeViewController {
                nextViewController.drinkSelectedAndAmount = drinkSelected
            }
        }
    }
    
}

extension DrinksListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell") as? DrinksListCell else { return UITableViewCell()
        }
        if indexPath.row == 0 {
            cell.drinkNameLabel.text = drinks[indexPath.row].0
            cell.drinkImage.image = UIImage(named: "cerveja_normal")
        }
//        else if indexPath.row == 1 {
//            cell.drinkNameLabel.text = drinks[indexPath.row].0
//            cell.drinkImage.image = UIImage(named: "vinho")
//        }
        cell.selectionStyle = .none
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        drinkSelected.0 = drinks[indexPath.row].0
        drinkSelected.1 = drinks[indexPath.row].1
        performSegue(withIdentifier: "selectedDrinkSegue", sender: nil)
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 130
//    }
    
    
    
}
