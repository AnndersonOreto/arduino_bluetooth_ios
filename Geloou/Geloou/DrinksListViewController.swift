//
//  DrinksListViewController.swift
//  Geloou
//
//  Created by Vitor Demenighi on 09/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import UIKit

class DrinksListViewController: UIViewController {

    
    let drinks: [String] = ["Cerveja", "Vinho", "Água", "Refri"]
    var drinkSelected: String = ""
    
    @IBOutlet weak var drinksTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drinksTableView.dataSource = self
        drinksTableView.delegate = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectedDrinkSegue" {
            if let nextViewController = segue.destination as? UINavigationController {
                let vc = nextViewController.viewControllers.first as? DetailViewController
                
                vc?.drinkTitle = drinkSelected
                
            }
        }
    }
    


}

extension DrinksListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell")
        cell?.textLabel?.text = drinks[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        drinkSelected = drinks[indexPath.row]
        performSegue(withIdentifier: "selectedDrinkSegue", sender: nil)
    }
    
}
