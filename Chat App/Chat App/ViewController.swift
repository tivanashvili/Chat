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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(topChatView)
        view.addSubview(separatorView)
        view.addSubview(bottomChatView)
        setUpLayoutConstraints()
    }

    // MARK: layout constraints
    //change name on func
    private func setUpLayoutConstraints(){
        topChatView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        bottomChatView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            topChatView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
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
        ])
    }

}

