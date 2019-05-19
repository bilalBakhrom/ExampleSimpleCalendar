//
//  ExampSimpleCalendar.swift
//  Example
//
//  Created by Bilal Bakhrom on 18/05/2019.
//  Copyright © 2019 Bilal Bakhrom. All rights reserved.
//

import UIKit
import SimpleCalendar

class ExampSimpleCalendar: UIViewController, SimpleCalendarDelegate {
    
    /******************************** EXAMPLE OF SimpleCalendar ********************************/
    
    
    @objc private func pushSimpleCalendar(_ sender: UIButton) {
        let controller = SimpleCalendar { (config) in
            config.barImage = UIImage(named: "icon")
            // default config
        }
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @objc private func presentSimpleCalendar(_ sender: UIButton) {
        // Configure
        let controller = SimpleCalendar { (config) in
            config.shouldCloseIfLimitReached = true
            config.selectionLimit = 3
            config.locale = Locale(identifier: "ru")
            config.barTitle = "Мой календарь"
            config.barTitleColor = .red
            config.barImage = UIImage(named: "icon")
            
            config.configureCell { (cellConfig) in
                cellConfig.dayCellSelectionStyle = .circle
                cellConfig.dayCellBackgroundColor = .clear
                cellConfig.selectedDayCellBackgroundColor = .red
            }
            
            config.configureDate { (dateConfig) in
                dateConfig.setStartDate(month: .january, year: 2019)
                dateConfig.setEndDate(month: .june, year: 2019)
            }
        }
        
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
    
    // MARK: - SimpleCalendarDelegate

    /// - TAG: Optional method
    func simpleCalendar() -> [Date] {
        return []
    }
    
    /// - TAG: Required method
    func simpleCalendar(selectedDates dates: [Date]) {
        var string = ""
        for date in dates {
            string += "\(dateFormatter.string(from: date))\n"
        }
        textView.text = string
    }

    /************************************************************************************************/
    
    
    
    
    
    /******************************** Not releated to SimpleCalendar ********************************/
    
    let dateFormatter: DateFormatter = {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        format.locale = Locale(identifier: "en_US_POSIX")
        format.timeZone = TimeZone(secondsFromGMT: 0)
        return format
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        textView.textAlignment = .center
        textView.textColor = .white
        textView.backgroundColor = .blue
        textView.alpha = 0.5
        textView.isUserInteractionEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 10.0
        return textView
    }()
    
    private let pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("Push", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present", for: .normal)
        button.backgroundColor = UIColor.red
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Calendar Demo"
        initSubviews()
    }
    
    private func initSubviews() {
        view.addSubview(pushButton)
        view.addSubview(presentButton)
        view.addSubview(textView)
        
        pushButton.addTarget(self, action: #selector(pushSimpleCalendar(_:)), for: .touchUpInside)
        presentButton.addTarget(self, action: #selector(presentSimpleCalendar(_:)), for: .touchUpInside)
        
        setSubviewsConstraints()
    }
    
    
    private func setSubviewsConstraints() {
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.heightAnchor.constraint(equalToConstant: view.bounds.height/2),
            
            pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pushButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20),
            pushButton.heightAnchor.constraint(equalToConstant: view.bounds.height/8),
            
            
            presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            presentButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 20),
            presentButton.heightAnchor.constraint(equalToConstant: view.bounds.height/8)
            ])
        
    }
    
    /************************************************************************************************/
}

