//
//  ViewController.swift
//  Chat App
//
//  Created by tornike on 28.04.23.
//

import UIKit

class ViewController: UIViewController {

    private let topChatView = ChatView()
    private let separatorView = UIView()
    private let bottomChatView = ChatView()
    private let switchButton = DayLightSwitch(isOn: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(topChatView)
        view.addSubview(separatorView)
        view.addSubview(bottomChatView)
        view.addSubview(switchButton)
        separatorView.backgroundColor = Constants.ChatAppColors.separatorViewColor
        setUpConstraintsForSubviews()
        switchButton.delegate = self
    }

    // MARK: layout constraints
    private func setUpConstraintsForSubviews() {
        topChatView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        bottomChatView.translatesAutoresizingMaskIntoConstraints = false
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topChatView.topAnchor.constraint(equalTo: switchButton.bottomAnchor),
            topChatView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topChatView.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: Constants.TopChatViewConstraints.bottom),
            topChatView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            separatorView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            separatorView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            separatorView.topAnchor.constraint(equalTo: topChatView.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: Constants.SeparatorView.viewHeight),
            
            bottomChatView.topAnchor.constraint(equalTo: separatorView.bottomAnchor),
            bottomChatView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomChatView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomChatView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            switchButton.widthAnchor.constraint(equalToConstant: 54),
            switchButton.heightAnchor.constraint(equalToConstant: 27),
            switchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            switchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12)
        ])
    }
}

extension ViewController: DayLightSwitchDelegate
{
    
    func didToggleDayLightSwitch(isOn: Bool) {
        if isOn {
            // Dark mode is on
            topChatView.backgroundColor = Constants.ChatAppColors.darkModeColor
            bottomChatView.backgroundColor = Constants.ChatAppColors.darkModeColor
            separatorView.backgroundColor = Constants.ChatAppColors.darkModeColor
        } else {
            // Day mode is on
            topChatView.backgroundColor = .clear
            bottomChatView.backgroundColor = .clear
            separatorView.backgroundColor = .clear
        }
    }
}
