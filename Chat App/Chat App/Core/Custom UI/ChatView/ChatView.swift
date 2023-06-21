//
//  ChatView.swift
//  ChatAppV2
//
//  Created by tornike on 26.04.23.
//

import UIKit

protocol ChatViewDelegate: AnyObject {
    func didSendMessage(message: Message)
}

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
    weak var sendButtonDelegate: ChatViewDelegate?
    
    private let loggedInUserID: Int
    private var messages: [Message]
    
    // MARK: Init
    init(loggedInUserID: Int, messages: [Message]) {
        self.loggedInUserID = loggedInUserID
        self.messages = messages
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refresh(messages: [Message]) {
        self.messages = messages
        self.tableView.reloadData()
        let lastRow = messages.count - 1
        let lastIndexPath = IndexPath(row: lastRow, section: 0)
        tableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: true)
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
        textInputComponentView.delegate = self
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
        cell.configure(with: message, bubblePosition: message.userID != loggedInUserID ? .left : .right)
        
        return cell
    }
}

// MARK: - TextInputComponentViewDelegate
extension ChatView: TextInputComponentViewDelegate {
    func didTapButton(text: String) {
        sendButtonDelegate?.didSendMessage(message: Message(userID: loggedInUserID, message: text, date: Date(), sendFailed: !Reachability.isConnectedToNetwork()))
    }
}
