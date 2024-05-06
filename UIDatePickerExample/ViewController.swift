//
//  ViewController.swift
//  UIDatePickerExample
//
//  Created by 장효원 on 5/6/24.
//

import UIKit

class ViewController: UIViewController {
    let datePicker = UIDatePicker()
    
    let autoButton = UIButton()
    let wheelsButton = UIButton()
    let compactButton = UIButton()
    let inlineButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupProperties()
        setupUI()
    }
    
    private func setupProperties() {
        self.view.backgroundColor = .white
        
        datePicker.datePickerMode = .date
        
        autoButton.tag = 1
        wheelsButton.tag = 2
        compactButton.tag = 3
        inlineButton.tag = 4
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        autoButton.translatesAutoresizingMaskIntoConstraints = false
        wheelsButton.translatesAutoresizingMaskIntoConstraints = false
        compactButton.translatesAutoresizingMaskIntoConstraints = false
        inlineButton.translatesAutoresizingMaskIntoConstraints = false
        
        autoButton.setTitle("automatic", for: .normal)
        autoButton.setTitleColor(.black, for: .normal)
        autoButton.addTarget(self, action: #selector(changePreferredDatePickerStyle), for: .touchUpInside)
        
        wheelsButton.setTitle("wheels", for: .normal)
        wheelsButton.setTitleColor(.black, for: .normal)
        wheelsButton.addTarget(self, action: #selector(changePreferredDatePickerStyle), for: .touchUpInside)
        
        compactButton.setTitle("compact", for: .normal)
        compactButton.setTitleColor(.black, for: .normal)
        compactButton.addTarget(self, action: #selector(changePreferredDatePickerStyle), for: .touchUpInside)
        
        inlineButton.setTitle("inline", for: .normal)
        inlineButton.setTitleColor(.black, for: .normal)
        inlineButton.addTarget(self, action: #selector(changePreferredDatePickerStyle), for: .touchUpInside)
        
        /*
         
         */
        datePicker.preferredDatePickerStyle = .wheels
    }

    private func setupUI() {
        [
            datePicker,
            autoButton,
            wheelsButton,
            compactButton,
            inlineButton
        ].forEach {
            self.view.addSubview($0)
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            datePicker.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            datePicker.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            datePicker.heightAnchor.constraint(equalToConstant: 500),
            
            autoButton.topAnchor.constraint(equalTo: self.datePicker.bottomAnchor, constant: 0),
            autoButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            autoButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            autoButton.heightAnchor.constraint(equalToConstant: 50),
            
            wheelsButton.topAnchor.constraint(equalTo: self.autoButton.bottomAnchor, constant: 0),
            wheelsButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            wheelsButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            wheelsButton.heightAnchor.constraint(equalToConstant: 50),
            
            compactButton.topAnchor.constraint(equalTo: self.wheelsButton.bottomAnchor, constant: 0),
            compactButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            compactButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            compactButton.heightAnchor.constraint(equalToConstant: 50),
            
            inlineButton.topAnchor.constraint(equalTo: self.compactButton.bottomAnchor, constant: 0),
            inlineButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            inlineButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            inlineButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc
    private func changePreferredDatePickerStyle(_ sender: UIButton) {
        if sender.tag == 1 {
            // automatic
            datePicker.preferredDatePickerStyle = .automatic
        } else if sender.tag == 2 {
            // wheels
            datePicker.preferredDatePickerStyle = .wheels
        } else if sender.tag == 3{
            // compact
            datePicker.preferredDatePickerStyle = .compact
        } else {
            // inline
            datePicker.preferredDatePickerStyle = .inline
        }
    }
}
