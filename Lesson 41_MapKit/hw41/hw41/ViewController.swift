//
//  ViewController.swift
//  hw41
//
//  Created by Алексей on 17.11.24.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    
    private lazy var locationButton: UIButton = {
        let button = UIButton(type: .system)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        let locationIcon = UIImage(systemName: "location.fill", withConfiguration: largeConfig)
        button.setImage(locationIcon, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(showUserLocation), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupMapView()
        setupLocationButton()
        setupPins()
        centerMapOnMogilev()
        setupLocationManager()
    }

    private func setupMapView() {
        mapView.frame = view.bounds
        view.addSubview(mapView)
    }

    private func setupLocationButton() {
        view.addSubview(locationButton)
        
        NSLayoutConstraint.activate([
            locationButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            locationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            locationButton.widthAnchor.constraint(equalToConstant: 60),
            locationButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupPins() {
        let landmarks = [
            ("Звездочёт", 53.900543, 30.331053),
            ("Площадь Славы", 53.898720, 30.329480),
            ("Собор Трёх Святителей", 53.897694, 30.331999),
            ("Могилёвский драмтеатр", 53.898120, 30.331092),
            ("Парк Подниколье", 53.896843, 30.344597)
        ]

        for (name, latitude, longitude) in landmarks {
            let annotation = MKPointAnnotation()
            annotation.title = name
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            mapView.addAnnotation(annotation)
        }
    }

    private func centerMapOnMogilev() {
        let mogilevCoordinate = CLLocationCoordinate2D(latitude: 53.900543, longitude: 30.331053)
        let region = MKCoordinateRegion(
            center: mogilevCoordinate,
            latitudinalMeters: 5000,
            longitudinalMeters: 5000
        )
        mapView.setRegion(region, animated: true)
    }

    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    @objc private func showUserLocation() {
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            showErrorAlert()
        @unknown default:
            fatalError("Неизвестный статус авторизации")
        }
    }

    private func showErrorAlert() {
        let alert = UIAlertController(
            title: "Нет доступа к геолокации",
            message: "Для отображения местоположения необходимо разрешить доступ к геолокации в настройках",
            preferredStyle: .alert
        )
        let settingsAction = UIAlertAction(title: "Настройки", style: .default) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let region = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: 500,
            longitudinalMeters: 500
        )
        mapView.setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            mapView.showsUserLocation = true
        case .denied, .restricted:
            showErrorAlert()
        default:
            break
        }
    }
}


