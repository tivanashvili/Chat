//
//  ChatView.swift
//  ChatAppV2
//
//  Created by tornike on 26.04.23.
//

import UIKit

final class ChatView: UIView {
    
    // MARK: Components
    private let textInputComponentView = TextInputComponentView()
    private let messages = [
        Message(text: "Hello", date: Date()),
        Message(text: "How are you?", date: Date()),
        Message(text: "I'm doing well, thanks!", date: Date())
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: Constants.CellConstants.cellIdentifier)
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    private func setUp(){
        setUpChatView()
        setUpTableView()
        setUpTextInputComponentView()
        setUpLayoutConstraints()
    }
    
    private func setUpChatView() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpTextInputComponentView() {
        textInputComponentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textInputComponentView)
    }
    
    private func setUpTableView() {
        tableView.dataSource = self
        addSubview(tableView)
    }
    
    // MARK: Layout Constraints
    private func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: topAnchor),
            leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomAnchor.constraint(equalTo: bottomAnchor),
            trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.TableViewConstraints.top),
            tableView.bottomAnchor.constraint(equalTo: textInputComponentView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.TableViewConstraints.top),
            
            textInputComponentView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            textInputComponentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            textInputComponentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            textInputComponentView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource
extension ChatView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellConstants.cellIdentifier, for: indexPath) as? MessageTableViewCell else {
            fatalError("Unable to dequeue MessageTableViewCell")
        }
        let message = messages[indexPath.row]
        cell.configure(with: message)
        
        return cell
    }
}
