//
//  ThirdViewController.swift
//  hw13
//
//  Created by Алексей on 26.07.24.
//

import UIKit

class ThirdTableViewController: UITableViewController {

    let programmingLanguages = ["Swift", "Python", "JavaScript", "Java", "C#", "C++", "Ruby", "Kotlin", "Go", "PHP"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "detailCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 10
        } else {
            return programmingLanguages.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "detailCell")
            cell.textLabel?.text = "Ячейка \(indexPath.row)"
            cell.detailTextLabel?.text = "Секция \(indexPath.section)"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
            cell.textLabel?.text = programmingLanguages[indexPath.row]
            return cell
        }
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Секция 0"
        } else {
            return "Секция 1"
        }
    }
}

