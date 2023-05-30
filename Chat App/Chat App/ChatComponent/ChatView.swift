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
    let recievedData: ReceivedData = ReceivedData(loggedInUserID: 1, messages: [
        Message(userID: 2, message: "Hello", date: Date()),
        Message(userID: 1, message: "How are you?", date: Date()),
        Message(userID: 2, message: "Thanks", date: Date()),
        Message(userID: 1, message: "Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text", date: Date()),
        Message(userID: 1, message: "Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text,Long Text", date: Date()),
    ])
    
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
        recievedData.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellConstants.cellIdentifier, for: indexPath) as! MessageTableViewCell
        
        let message = recievedData.messages[indexPath.row]
        cell.configure(with: message, bubblePosition: message.userID == recievedData.loggedInUserID ? .left : .right)

        return cell
    }
}
