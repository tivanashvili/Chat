//
//  ViewController.swift
//  Chat App
//
//  Created by tornike on 28.04.23.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: Components
    private let topChatView = ChatView()
    private let separatorView = UIView()
    private let bottomChatView = ChatView()
    private let switchButton = DayLightSwitch()
    private var statusBarStyle: UIStatusBarStyle = .darkContent
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return statusBarStyle
    }
    
    func setUp() {
        let subviews: [UIView] = [topChatView, separatorView, bottomChatView, switchButton]
        
        separatorView.backgroundColor = Constants.SeparatorView.separatorViewColor
        subviews.forEach { view.addSubview($0) }
        
        setUpConstraintsForSubviews()
        switchButton.delegate = self
    }
    
    // MARK: layout constraints
    private func setUpConstraintsForSubviews() {
        [topChatView, separatorView, bottomChatView, switchButton].forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
        
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
            
            switchButton.widthAnchor.constraint(equalToConstant: DayLightSwitch.Constants.width),
            switchButton.heightAnchor.constraint(equalToConstant: DayLightSwitch.Constants.height),
            switchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: DayLightSwitch.Constants.top),
            switchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: DayLightSwitch.Constants.trailing)
        ])
    }
}
// MARK: Switcher Delegate
extension ViewController: DayLightSwitchDelegate {
    func didToggleSwitch(with state: BackgroundMode) {
        switch state {
        case .light:
            updateBackground(with: .white, statusBarStyle: .darkContent)
        case .dark:
            updateBackground(with: Constants.ViewColor.darkModeColor, statusBarStyle: .lightContent)
        }
        setNeedsStatusBarAppearanceUpdate()
    }
    func updateBackground(with color: UIColor, statusBarStyle: UIStatusBarStyle) {
        [topChatView, bottomChatView, view].forEach { $0.backgroundColor = color }
        self.statusBarStyle = statusBarStyle
    }
}
