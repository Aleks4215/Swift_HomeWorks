//
//  ViewController.swift
//  hw23
//
//  Created by Алексей on 30.08.24.
//

import UIKit
import WebKit


class ViewController: UIViewController {
    
    var history: [String] = []
    var bookmarks: [(title: String, url: String)] = []
    var defaultURL = "https://apple.com"
    
    
    lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var urlTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "Введите URL"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .go
        textField.delegate = self
        textField.textAlignment = .center
        textField.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        textField.layer.cornerRadius = 12.0
        textField.layer.masksToBounds = true
        return textField
    }()
    
    lazy var goButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var wrapper: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backButton: UIButton = {
       let button = UIButton()
        button.isEnabled = false
        button.setTitle("←", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray, for: .disabled)
        button.addAction(UIAction { _ in self.webView.goBack() }, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var forwardButton: UIButton = {
       let button = UIButton()
        button.isEnabled = false
        button.setTitle("→", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray, for: .disabled)
        button.addAction(UIAction { _ in self.webView.goForward() }, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var openHistoryButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "clock"), for: .normal)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(openHistoryButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var addBookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "books.vertical"), for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(addBookmarkButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var openBookmarksButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(openBookmarksButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func openBookmarksButtonTapped() {
        let bookmarksVC = BookmarksTableViewController(bookmarks: bookmarks)
        bookmarksVC.onBookmarkSelected =  { [weak self] url in
            self?.loadURL(from: url)
        }
        self.present(bookmarksVC, animated: true)
    }
    
    @objc func goButtonTapped() {
        guard let text = urlTextField.text, !text.isEmpty else { return }
        loadURL(from: text)
    }
    
    @objc func openHistoryButtonTapped() {
        let historyVC = HistoryTableViewController(history: history)
        historyVC.onHistorySelected = { [weak self] url in
            self?.loadURL(from: url)
        }
        self.present(historyVC, animated: true)
        
    }
    
    @objc func addBookmarkButtonTapped() {
        let url = webView.url?.absoluteString
        let title = webView.title
        let addBookmarkVC = AddBookmarkViewController(title: title, url: url)
        addBookmarkVC.onAddBookmark = { [weak self] title, url in
            self?.bookmarks.append((title, url))
        }
        self.present(addBookmarkVC, animated: true)
    }
    
    func loadURL(from urlString: String) {
        guard let url = URL(string: urlString.hasPrefix("http") ? urlString : "https://\(urlString)") else {
            redirectToGoogleSearch(query: urlString)
            return
        }
        webView.load(URLRequest(url: url))
    }
    
    func redirectToGoogleSearch(query: String) {
        let searchQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        let googleSearchURL = "https://www.google.com/search?q=\(searchQuery)"
        if let url = URL(string: googleSearchURL) {
            webView.load(URLRequest(url: url))
        }
    }
    
    func setupWrapper() {
        view.addSubview(wrapper)
        NSLayoutConstraint.activate([
            wrapper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            wrapper.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            wrapper.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            wrapper.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        view.backgroundColor = .white
    }
    
    func setupURLString() {
        wrapper.addSubview(urlTextField)
        wrapper.addSubview(goButton)
        
        NSLayoutConstraint.activate([
            urlTextField.topAnchor.constraint(equalTo: wrapper.topAnchor, constant: 10),
            urlTextField.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor, constant: 10),
            urlTextField.trailingAnchor.constraint(equalTo: goButton.leadingAnchor, constant: -10),
            goButton.trailingAnchor.constraint(equalTo: wrapper.trailingAnchor, constant: -10),
            goButton.centerYAnchor.constraint(equalTo: urlTextField.centerYAnchor),
            urlTextField.heightAnchor.constraint(equalToConstant: 44),
            goButton.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setupBottomItems() {
        wrapper.addSubview(stackView)
        stackView.backgroundColor = .white
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            stackView.leadingAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 40),
            stackView.bottomAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.bottomAnchor)
        ])
        stackView.addArrangedSubview(backButton)
        stackView.addArrangedSubview(forwardButton)
        stackView.addArrangedSubview(addBookmarkButton)
        stackView.addArrangedSubview(openBookmarksButton)
        stackView.addArrangedSubview(openHistoryButton)
    }
    
    func setupWebView() {
        wrapper.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: urlTextField.bottomAnchor, constant: 10),
            webView.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: wrapper.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: wrapper.bottomAnchor)
        ])
    }
    
    func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        wrapper.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        urlTextField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWrapper()
        setupGesture()
        setupURLString()
        setupWebView()
        setupBottomItems()
        loadURL(from: defaultURL)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == urlTextField {
            goButtonTapped()
            textField.resignFirstResponder()
            return true
        }
        return false
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
   
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if let currentURL = webView.url?.absoluteString {
            urlTextField.text = currentURL
            history.insert(currentURL, at: 0)
        }
        updateNavigationButtons()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        if let failingURL = webView.url?.absoluteString, failingURL != "about:blank" {
            redirectToGoogleSearch(query: failingURL)
        }
    }
    
    private func updateNavigationButtons() {
          backButton.isEnabled = webView.canGoBack
          forwardButton.isEnabled = webView.canGoForward
      }
}


#Preview {
    ViewController()
}
