//
//  ViewController.swift
//  hw40
//
//  Created by Алексей on 22.11.24.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.addTarget(self, action: #selector(addButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let db = Firestore.firestore()
    
    private var tasks: [(id: String, title: String)] = [] {
        didSet {
            print("Tasks updated: \(tasks)")
            tableView.reloadData()
        }
    }
    
    @objc func addButtonDidTap() {
        let addTaskVC = AddTaskViewController()
        
        addTaskVC.taskAddedCallback = { [weak self] in
            self?.fetchTasks()
        }
        navigationController?.pushViewController(addTaskVC, animated: true)
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        view.addSubview(addButton)
        navigationController?.view.backgroundColor = .white
                
        NSLayoutConstraint.activate([
            tableView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            addButton.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            addButton.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            addButton.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 44),
            addButton.safeAreaLayoutGuide.widthAnchor.constraint(equalToConstant: 100)
            ])
    }
    
    private func fetchTasks() {
           db.clearPersistence()
           db.collection("tasks").getDocuments { [weak self] snapshot, error in
               guard let self = self else { return }
               if let error = error {
                   print("Error fetching tasks: \(error)")
                   return
               }

               self.tasks = snapshot?.documents.compactMap {
                   guard let title = $0["title"] as? String else { return nil }
                   return (id: $0.documentID, title: title)
               } ?? []
           }
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchTasks()
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            db.collection("tasks").document(task.id).delete { [weak self] error in
                if let error = error {
                    print("Error deleting task: \(error)")
                    return
                }
                
                self?.tasks.remove(at: indexPath.row)
            }
        }
    }
}

