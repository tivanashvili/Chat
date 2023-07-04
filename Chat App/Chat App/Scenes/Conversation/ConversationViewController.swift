//
//  ConversationViewController.swift
//  Chat App
//
//  Created by tornike on 28.04.23.
//

import UIKit

final class ConversationViewController: UIViewController {
    
    // MARK: Components
    private lazy var topChatView: ChatView = {
        let chatView = ChatView(loggedInUserID: Constants.userID.topChatViewUserID, messages: conversationViewModel.getMessages(userID: topChatViewUserID))
        chatView.sendButtonDelegate = self
        chatView.translatesAutoresizingMaskIntoConstraints = false
        return chatView
    }()
    
    private lazy var bottomChatView: ChatView = {
        let chatView = ChatView(loggedInUserID: Constants.userID.bottomChatViewUserID, messages: conversationViewModel.getMessages(userID: bottomChatViewUserID))
        chatView.sendButtonDelegate = self
        chatView.translatesAutoresizingMaskIntoConstraints = false
        return chatView
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.SeparatorView.separatorViewColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var switchButton: DayLightSwitch = {
        let switchButton = DayLightSwitch()
        switchButton.delegate = self
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        return switchButton
    }()
    
    private let conversationViewModel = ConversationViewModel()
    
    // MARK: Properties
    private var statusBarStyle: UIStatusBarStyle = .darkContent
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return statusBarStyle
    }
    
    private let topChatViewUserID = Constants.userID.topChatViewUserID
    private let bottomChatViewUserID = Constants.userID.bottomChatViewUserID
    
    private var isDarkMode = false {
        didSet {
            UserDefaults.standard.set(isDarkMode, forKey: Constants.userDefaultKey)
            updateAppearance(isDarkMode: isDarkMode)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        addTapGestureRecognizer()
        setUpInitialAppearance()
    }
    
    func setUp() {
        let subviews = [topChatView, separatorView, bottomChatView, switchButton]
        subviews.forEach { view.addSubview($0) }
        
        setUpConstraintsForSubviews()
    }
    
    private func addTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func setUpSwitchButtonViewToggle() {
        switchButton.addTarget(self, action: #selector(switchButtonToggled(_:)), for: .valueChanged)
    }

    @objc private func switchButtonToggled(_ sender: UISwitch) {
        let isOn = sender.isOn
        UserDefaults.standard.set(isOn, forKey: Constants.userDefaultKey)
        updateAppearance(isDarkMode: isOn)
    }
    
    private func updateAppearance(isDarkMode: Bool) {
        view.backgroundColor = isDarkMode ? Constants.ViewColor.darkModeColor : .white
        switchButton.checkButtonState(isDarkMode: isDarkMode)
        statusBarStyle = isDarkMode ? .lightContent : .darkContent
        setUpMessageColors(with: isDarkMode ? .white : .black)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    private func setUpMessageColors(with color: UIColor) {
        topChatView.setUptextInputComponentViewColor(with: color)
        bottomChatView.setUptextInputComponentViewColor(with: color)
    }
    
    private func setUpInitialAppearance() {
        isDarkMode = UserDefaults.standard.bool(forKey: Constants.userDefaultKey)
    }
    
    // MARK: layout constraints
    private func setUpConstraintsForSubviews() {
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
// MARK: - Switcher Delegate
extension ConversationViewController: DayLightSwitchDelegate {
    func didToggleSwitch(with state: BackgroundMode) {
        switch state {
        case .light:
            UserDefaults.standard.set(false, forKey: Constants.userDefaultKey)
            updateAppearance(isDarkMode: false)
        case .dark:
            UserDefaults.standard.set(true, forKey: Constants.userDefaultKey)
            updateAppearance(isDarkMode: true)
        }
    }

    func updateBackground(with color: UIColor, statusBarStyle: UIStatusBarStyle) {
        [topChatView, bottomChatView, view].forEach { $0.backgroundColor = color }
        self.statusBarStyle = statusBarStyle
    }
}
extension ConversationViewController: ChatViewDelegate {
    func didSendMessage(message: Message) {        
        conversationViewModel.saveMessage(message: message)
        topChatView.refresh(messages: conversationViewModel.getMessages(userID: topChatViewUserID))
        bottomChatView.refresh(messages: conversationViewModel.getMessages(userID: bottomChatViewUserID))
    }
}
