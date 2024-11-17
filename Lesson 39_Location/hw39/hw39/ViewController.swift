//
//  ViewController.swift
//  hw39
//
//  Created by Алексей on 17.11.24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    private let locationManager = CLLocationManager()
    private var longitude: Double = 0
    private var latitude: Double = 0
    
    private lazy var showLocationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Показать локацию", for: .normal)
        button.addTarget(self, action: #selector(showLocationButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLocationManager()
    }
    
    private func setupUI() {
        view.addSubview(showLocationButton)
        
        NSLayoutConstraint.activate([
            showLocationButton.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            showLocationButton.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            showLocationButton.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    private func showErrorAlert() {
        let alert = UIAlertController(title: "Нет доступа к геолокации", message: "Нужно разрешить доступ к геолокации в настройках", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        let settings = UIAlertAction(title: "Настройки", style: .default, handler: { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        })
        alert.addAction(action)
        alert.addAction(settings)
        present(alert, animated: true)
    }
    
    private func showAlertWithLocation() {
        let alert = UIAlertController(title: "Текущая локация", message: "Долгота: \(longitude), Широта: \(latitude)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @objc private func showLocationButtonTapped() {
        locationManager.delegate = self
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .notDetermined:
            requestLocationAuthorization()
        case .restricted, .denied:
            showErrorAlert()
        @unknown default:
            fatalError("Неизвестный статус авторизации")
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        longitude = location.coordinate.longitude
        latitude = location.coordinate.latitude
        locationManager.stopUpdatingLocation()
        showAlertWithLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .denied, .restricted:
            showErrorAlert()
        default:
            break
        }
    }
}
