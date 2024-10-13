//
//  ViewController.swift
//  hw33
//
//  Created by Алексей on 10.10.24.
//

import UIKit

class ViewController: UIViewController  {
    
    var remiders: [Reminder] = [] {
        didSet {
            tableView.reloadData()
            scheduleNotifications()
        }
    }
    
    let reuseIdentifier = "reminderCell"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    @objc func navItemDidTap() {
        let vc = AddReminderViewController()
        vc.delegate = self
        vc.modalPresentationStyle = .pageSheet
        vc.sheetPresentationController?.detents = [.medium()]
        present(vc, animated: true)
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navItemDidTap))
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
    }
    
    func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if !granted {
                DispatchQueue.main.async {
                    self.showSettingsAlert()
                }
            }
        }
    }
    
    func showSettingsAlert() {
        let alertController = UIAlertController(
            title: "Уведомления отключены",
            message: "Для включения уведомлений перейдите в настройки",
            preferredStyle: .alert
        )
        
        let settingsAction = UIAlertAction(title: "Настройки", style: .default) { _ in
            if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSettings)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        
        alertController.addAction(settingsAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
    func scheduleNotifications() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        for reminder in remiders {
            let content = UNMutableNotificationContent()
            content.title = reminder.name
            content.body = "Напоминание: день рождения \(reminder.name) завтра"
            content.sound = .default
            
            guard let notificationDate = Calendar.current.date(byAdding: .day, value: -1, to: reminder.date) else {
                continue
            }
            
            let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: notificationDate)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request) { error in
                if let error = error {
                    print("Ошибка планирования уведомления: \(error.localizedDescription)")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        requestNotificationPermission()
    }
}

extension ViewController: AddReminderViewControllerDelegate {
    func didCreateReminder(name: String, date: Date) {
        remiders.append(Reminder(name: name, date: date))
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        remiders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let remider = remiders[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = remider.name
        content.secondaryText = DateFormatter.localizedString(from: remider.date, dateStyle: .short, timeStyle: .short)
        
        cell.contentConfiguration = content
        
        return cell
    }
}
