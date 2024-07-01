//
//  HomeViewController.swift
//  AppSnapKit
//
//  Created by Алексей on 29.06.24.
//

import UIKit
import SnapKit

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
        container.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
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
        
        welcomeLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(container.snp.centerX)
            make.top.equalTo(container.snp.top).offset(10)
        }
        
        controlPageLabel.snp.makeConstraints {(make) -> Void in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(15)
            make.leading.equalTo(welcomeLabel.snp.leading)
        }
        
        homeIcon.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(controlPageLabel.snp.bottom).offset(5)
            make.leading.equalTo(controlPageLabel.snp.leading)
        }
        
        lightsLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(homeIcon.snp.bottom).offset(25)
            make.leading.equalTo(homeIcon.snp.leading)
        }
        
        lightsSegment.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(lightsLabel.snp.bottom).offset(5)
            make.leading.equalTo(lightsLabel.snp.leading)
            make.width.equalTo(container.snp.width).offset(-90)
        }
        
        doorLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(lightsSegment.snp.bottom).offset(15)
            make.leading.equalTo(lightsSegment.snp.leading)
        }
        
        doorSegment.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(doorLabel.snp.bottom).offset(5)
            make.leading.equalTo(doorLabel.snp.leading)
            make.width.equalTo(container.snp.width).offset(-20)
        }
        
        acLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(doorSegment.snp.bottom).offset(15)
            make.leading.equalTo(doorSegment.snp.leading)
        }
        
        acSegment.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(acLabel.snp.bottom).offset(5)
            make.leading.equalTo(acLabel.snp.leading)
            make.width.equalTo(container.snp.width).offset(-90)
        }
        
        temperatureLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(acSegment.snp.bottom).offset(15)
            make.leading.equalTo(acSegment.snp.leading)
        }
        
        temperatureSlider.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(10)
            make.leading.equalTo(temperatureLabel.snp.leading)
            make.trailing.equalTo(container.snp.trailing).offset(-90)
        }
        
        sliderValueLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(10)
            make.leading.equalTo(temperatureSlider.snp.trailing).offset(5)
            make.centerY.equalTo(temperatureSlider.snp.centerY)
        }
        
        alarmButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(temperatureSlider.snp.bottom).offset(25)
            make.leading.equalTo(temperatureSlider.snp.leading)
            make.width.equalTo(90)
            make.height.equalTo(44)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
