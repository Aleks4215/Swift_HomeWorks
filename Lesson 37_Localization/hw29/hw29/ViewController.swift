//
//  ViewController.swift
//  hw29
//
//  Created by Алексей on 19.09.24.
//

import UIKit

class ViewController: UIViewController {
    
    var posts: [Post] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var addButton: UIBarButtonItem = {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        addButton.tintColor = .black
        return addButton
    }()
    
    @objc func addButtonTapped() {
        let addPostVC = AddPostViewController(id: nil)
        addPostVC.onCreate = { [weak self] in
            APIHelper.shared.getPosts(completion: { [weak self] posts in
                self?.posts = posts
            })
        }
        
        addPostVC.createButton.isHidden = false
        
        self.present(addPostVC, animated: true, completion: nil)
    }

    func setupUI() {
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = addButton
        tableView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            tableView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("posts", comment: "")
        setupUI()
        APIHelper.shared.getPosts(completion: { [weak self] posts in
            self?.posts = posts
        })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = posts[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postVC = PostViewController(postId: posts[indexPath.row].id!, userId: posts[indexPath.row].userId)
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
            guard let self = self else { return }

            guard indexPath.row < self.posts.count else {
                completionHandler(false)
                return
            }

            guard let postId = self.posts[indexPath.row].id else {
                completionHandler(false)
                return
            }

            APIHelper.shared.deletePost(id: postId) { success in
                DispatchQueue.main.async {
                    if success {
                        tableView.performBatchUpdates({
                            self.posts.remove(at: indexPath.row)
                            tableView.deleteRows(at: [indexPath], with: .automatic)
                        }, completion: { _ in
                            completionHandler(success)
                        })
                    } else {
                        completionHandler(false)
                    }
                }
            }
        }
        deleteAction.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let updateAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] (action, view, completionHandler) in
            guard let self = self else { return }
            
            let postId = self.posts[indexPath.row].id!
            let addPostVC = AddPostViewController(id: postId)
            
            addPostVC.saveButton.isHidden = false
            
            addPostVC.onSave = { [weak self] in
                APIHelper.shared.getPosts { [weak self] updatedPosts in
                    self?.posts = updatedPosts
                    tableView.reloadData()
                }
            }
            
            self.present(addPostVC, animated: true, completion: nil)
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [updateAction])
    }
}
