//
//  UserViewController.swift
//  hw29
//
//  Created by Алексей on 20.09.24.
//

import UIKit
import MapKit

class UserViewController: UIViewController {
    
    let id: Int
    var user: User? {
        didSet {
            usernameValueLabel.text = user?.username
            emailValueLabel.text = user?.email
            phoneValueLabel.text = user?.phone
            companyValueLabel.text = user?.company.name
            updateMapView()
        }
    }
    
    lazy var usernameTitleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .systemGray
        label.text = "Username"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var usernameValueLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailTitleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .systemGray
        label.text = "Email"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailValueLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var phoneTitleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .systemGray
        label.text = "Phone"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var phoneValueLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var companyTitleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .systemGray
        label.text = "Company"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var companyValueLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var companyLocationView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func setupUI() {
       let wrapper = UIStackView(arrangedSubviews: [
        usernameTitleLabel,
        usernameValueLabel,
        emailTitleLabel,
        emailValueLabel,
        phoneTitleLabel,
        phoneValueLabel,
        companyTitleLabel,
        companyValueLabel,
        companyLocationView
       ])
       view.addSubview(wrapper)
       wrapper.axis = .vertical
       wrapper.spacing = 10
       wrapper.translatesAutoresizingMaskIntoConstraints = false
       
       NSLayoutConstraint.activate([
        wrapper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        wrapper.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
        wrapper.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        companyLocationView.heightAnchor.constraint(equalToConstant: 150)
       ])
    }
    
    func updateMapView() {
        guard let latitudeString = user?.address.geo.lat,
              let longitudeString = user?.address.geo.lng,
              let latitude = Double(latitudeString),
              let longitude = Double(longitudeString) else { return }

        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        companyLocationView.removeAnnotations(companyLocationView.annotations)

        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Местоположение"
        annotation.subtitle = "Широта: \(latitude), Долгота: \(longitude)"
        companyLocationView.addAnnotation(annotation)

        let region = MKCoordinateRegion(center: location, latitudinalMeters: 10000, longitudinalMeters: 10000)
        companyLocationView.setRegion(region, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        APIHelper.shared.getUser(id: id) { [weak self] user in
            guard let self = self else { return }
            self.user = user
        }
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
}

#Preview {
    UserViewController(id: 1)
}
