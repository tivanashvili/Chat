//
//  ViewController.swift
//  Chat App
//
//  Created by tornike on 28.04.23.
//

import UIKit

class ViewController: UIViewController {

    private let topChatView = ChatView()
    private let separatorView = SeparatorView()
    private let bottomChatView = ChatView()
    let switcherView = SwitcherView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(topChatView)
        view.addSubview(separatorView)
        view.addSubview(bottomChatView)
        view.addSubview(switcherView)
        setUpConstraintsForSubviews()
    }

    // MARK: layout constraints
    private func setUpConstraintsForSubviews() {
        topChatView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        bottomChatView.translatesAutoresizingMaskIntoConstraints = false
        switcherView.translatesAutoresizingMaskIntoConstraints = false
        let leadingConstraint = switcherView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 309)
        leadingConstraint.priority = UILayoutPriority(rawValue: 999)
        
        NSLayoutConstraint.activate([
            topChatView.topAnchor.constraint(equalTo: switcherView.bottomAnchor, constant: 16),
            topChatView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topChatView.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -30),
            topChatView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            separatorView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            separatorView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            bottomChatView.topAnchor.constraint(equalTo: separatorView.bottomAnchor),
            bottomChatView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomChatView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomChatView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            switcherView.widthAnchor.constraint(equalToConstant: 54),
            switcherView.heightAnchor.constraint(equalToConstant: 27),
            switcherView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            switcherView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            leadingConstraint,
        ])
    }
}



