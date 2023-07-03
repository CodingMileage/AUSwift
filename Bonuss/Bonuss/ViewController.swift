//
//  ViewController.swift
//  Bonuss
//
//  Created by Brandon LeBlanc on 7/3/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var cities = [
        City("Birmingham","AL"),
        City("New York","NY"),
        City("Atlanta","GA"),
        City("Oklahoma City","OK"),
        City("Tallahassee","FL"),
        City("Jackson","MS"),
        City("Clevland","OH"),
        City("Boston","MA"),
        City("Helena","MT"),
        City("Trenton","NJ")
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = cities[indexPath.row].city
        content.secondaryText = cities[indexPath.row].state
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _)  in
            print("Deleted" + self.cities[indexPath.row].city)
            self.cities.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

