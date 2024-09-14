//
//  BookmarksTableViewController.swift
//  hw23
//
//  Created by Алексей on 1.09.24.
//

import UIKit

class BookmarksTableViewController: UITableViewController {
    
    var bookmarks: [(title: String, url: String)]
    var onBookmarkSelected: ((String) -> Void)?
    
    init(bookmarks: [(title: String, url: String)]) {
        self.bookmarks = bookmarks
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bookmarks.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         return "Закладки"
     }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = bookmarks[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = bookmarks[indexPath.row].url
        onBookmarkSelected?(url)
        dismiss(animated: true)
    }

}

#Preview {
    BookmarksTableViewController(bookmarks: [(title: "313112", url: "43242432432423")])
}
