//
//  SecondViewController.swift
//  hw13
//
//  Created by Алексей on 26.07.24.
//

import UIKit


class CustomCell: UITableViewCell {
    
    let label1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let label2: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label1)
        contentView.addSubview(label2)
        
        NSLayoutConstraint.activate([
            label1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            label2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            label2.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SecondViewController: UIViewController  {
  
    let tableView = UITableView()
    let programmingLanguages: [String] = ["Swift", "Python", "JavaScript", "Java", "C#", "C++", "Ruby", "Kotlin", "Go", "PHP"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        
    }
    
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        programmingLanguages.count / 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell else { return UITableViewCell() }
        cell.label1.text = programmingLanguages[indexPath.row * 2]
        cell.label2.text = programmingLanguages[indexPath.row * 2 + 1]
        return cell
    }
    
    
}
