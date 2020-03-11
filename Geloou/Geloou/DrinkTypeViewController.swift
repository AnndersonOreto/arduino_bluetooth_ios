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
    
    
    @IBOutlet weak var drinkTypeTableview: UITableView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drinkTypeTableview.dataSource = self
        drinkTypeTableview.delegate = self
        descriptionLabel.text = "Qual o tipo de \(drinkSelectedAndAmount.0.lowercased()) você deseja gelar?"
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
        return drinkSelectedAndAmount.1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkTypeCell")
        cell?.textLabel?.text = drinkSelectedAndAmount.1[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        drinkSelected = (drinkSelectedAndAmount.0, drinkSelectedAndAmount.1[indexPath.row])
        performSegue(withIdentifier: "temperatureSegue", sender: nil)
    }
    
    
}
