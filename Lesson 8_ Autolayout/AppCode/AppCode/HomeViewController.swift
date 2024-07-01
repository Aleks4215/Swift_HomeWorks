//
//  HomeViewController.swift
//  AppCode
//
//  Created by Алексей on 29.06.24.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    private let container: UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome, user12314"
        label.font = .systemFont(ofSize: 38)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let controlPageLabel: UILabel = {
        let label = UILabel()
        label.text = "Appartment control page"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let homeIcon: UILabel = {
        let label = UILabel()
        label.text = "🏠"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lightsLabel: UILabel = {
        let label = UILabel()
        label.text = "Lights"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lightsSegment: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.insertSegment(withTitle: "On", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Off", at: 1, animated: true)
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .systemBlue
        segmentedControl.autoresizesSubviews = true
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let doorLabel: UILabel = {
        let label = UILabel()
        label.text = "Door"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let doorSegment: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.insertSegment(withTitle: "Lock", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Unlock", at: 1, animated: true)
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .systemBlue
        segmentedControl.autoresizesSubviews = true
        segmentedControl.selectedSegmentTintColor = .clear
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let acLabel: UILabel = {
        let label = UILabel()
        label.text = "AC"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let acSegment: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.insertSegment(withTitle: "Auto", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "On", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "Off", at: 2, animated: true)
        segmentedControl.selectedSegmentIndex = 2
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .systemBlue
        segmentedControl.autoresizesSubviews = true
        segmentedControl.selectedSegmentTintColor = .clear
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "Temperature"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let temperatureSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let sliderValueLabel: UILabel = {
        let label = UILabel()
        label.text = "21 C"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let alarmButton: UIButton = {
       let btn = UIButton()
        btn.backgroundColor = .white
        btn.setTitle("Alarm", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    func setupContainer() {
        view.addSubview(container)
        view.backgroundColor = .brown
        container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        container.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func setupUI() {
        setupContainer()
        container.addSubview(welcomeLabel)
        container.addSubview(controlPageLabel)
        container.addSubview(homeIcon)
        container.addSubview(lightsLabel)
        container.addSubview(lightsSegment)
        container.addSubview(doorLabel)
        container.addSubview(doorSegment)
        container.addSubview(acLabel)
        container.addSubview(acSegment)
        container.addSubview(temperatureLabel)
        container.addSubview(temperatureSlider)
        container.addSubview(sliderValueLabel)
        container.addSubview(alarmButton)
        
        
        welcomeLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        welcomeLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 10).isActive = true
        
        controlPageLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 15).isActive = true
        controlPageLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor).isActive = true
        
        homeIcon.topAnchor.constraint(equalTo: controlPageLabel.bottomAnchor, constant: 5).isActive = true
        homeIcon.leadingAnchor.constraint(equalTo: controlPageLabel.leadingAnchor).isActive = true
        
        lightsLabel.topAnchor.constraint(equalTo: homeIcon.bottomAnchor, constant: 25).isActive = true
        lightsLabel.leadingAnchor.constraint(equalTo: homeIcon.leadingAnchor).isActive = true
        
        lightsSegment.topAnchor.constraint(equalTo: lightsLabel.bottomAnchor, constant: 5).isActive = true
        lightsSegment.leadingAnchor.constraint(equalTo: lightsLabel.leadingAnchor).isActive = true
        lightsSegment.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -90).isActive = true
        
        doorLabel.topAnchor.constraint(equalTo: lightsSegment.bottomAnchor, constant: 15).isActive = true
        doorLabel.leadingAnchor.constraint(equalTo: lightsSegment.leadingAnchor).isActive = true
        
        doorSegment.topAnchor.constraint(equalTo: doorLabel.bottomAnchor, constant: 5).isActive = true
        doorSegment.leadingAnchor.constraint(equalTo: doorLabel.leadingAnchor).isActive = true
        doorSegment.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -90).isActive = true
        
        acLabel.topAnchor.constraint(equalTo: doorSegment.bottomAnchor, constant: 15).isActive = true
        acLabel.leadingAnchor.constraint(equalTo: doorSegment.leadingAnchor).isActive = true
        
        acSegment.topAnchor.constraint(equalTo: acLabel.bottomAnchor, constant: 5).isActive = true
        acSegment.leadingAnchor.constraint(equalTo: acLabel.leadingAnchor).isActive = true
        acSegment.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -90).isActive = true
        
        temperatureLabel.topAnchor.constraint(equalTo: acSegment.bottomAnchor, constant: 15).isActive = true
        temperatureLabel.leadingAnchor.constraint(equalTo: acSegment.leadingAnchor).isActive = true
        
        temperatureSlider.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 10).isActive = true
        temperatureSlider.leadingAnchor.constraint(equalTo: temperatureLabel.leadingAnchor).isActive = true
        temperatureSlider.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -90).isActive = true
        
        sliderValueLabel.leadingAnchor.constraint(equalTo: temperatureSlider.trailingAnchor, constant: 5).isActive = true
        sliderValueLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 10).isActive = true
        sliderValueLabel.centerYAnchor.constraint(equalTo: temperatureSlider.centerYAnchor).isActive = true

        alarmButton.topAnchor.constraint(equalTo: temperatureSlider.bottomAnchor, constant: 25).isActive = true
        alarmButton.leadingAnchor.constraint(equalTo: temperatureSlider.leadingAnchor).isActive = true
        alarmButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        alarmButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }

}
