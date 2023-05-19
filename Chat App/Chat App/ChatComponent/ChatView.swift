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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: Constants.CellConstants.cellIdentifier)
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    // MARK: Properties
    private let messages = [
        Message(text: "Hello", date: Date()),
        Message(text: "How are you?", date: Date()),
        Message(text: "I'm doing well, thanks!", date: Date())
    ]
    
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
        addSubview(textInputComponentView)
        addSubview(tableView)
        setUpTextInputComponentView()
        setUpTableView()
        setUpChatView()
    }
    
    private func setUpChatView() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: topAnchor),
            leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomAnchor.constraint(equalTo: bottomAnchor),
            trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setUpTableView() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.TableViewConstraints.top),
            tableView.bottomAnchor.constraint(equalTo: textInputComponentView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.TableViewConstraints.leading),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.TableViewConstraints.trailing)
        ])
    }
    
    private func setUpTextInputComponentView() {
        addSubview(textInputComponentView)
        textInputComponentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellConstants.cellIdentifier, for: indexPath) as! MessageTableViewCell
        let message = messages[indexPath.row]
        cell.configure(with: message)
        return cell
    }
}
