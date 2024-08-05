//
//  FirstTableViewController.swift
//  hw13
//
//  Created by Алексей on 26.07.24.
//

import UIKit

class FirstTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = String(indexPath.row)
        cell.contentConfiguration = content
        return cell
    }
}
