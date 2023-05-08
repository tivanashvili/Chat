//
//  ChatView.swift
//  ChatAppV2
//
//  Created by tornike on 26.04.23.
//

import UIKit

final class ChatView: UIView {
    
    //MARK: variables
    
    private let textInputComponentView = TextInputComponentView()
    private var messages = [
        Message(text: "Hello", date: Date()),
        Message(text: "How are you?", date: Date()),
        Message(text: "I'm doing well, thanks!", date: Date())
    ]

    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: "MessageTableViewCell")
        tableView.backgroundColor = .red
        return tableView
    }()

    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp(){
        setUpChatView()
        setUpTableView()
        setUpTextInputComponentView()
        setUpLayoutConstraints()
    }

    private func setUpChatView(){
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setUpTextInputComponentView(){
        textInputComponentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textInputComponentView)
    }
    
    private func setUpTableView() {
        self.addSubview(tableView)
    }

    // MARK : layout constraints
    private func setUpLayoutConstraints(){
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: topAnchor),
            self.leadingAnchor.constraint(equalTo: leadingAnchor),
            self.bottomAnchor.constraint(equalTo: bottomAnchor),
            self.trailingAnchor.constraint(equalTo: trailingAnchor),

            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.TableViewConstraints.top),
            tableView.bottomAnchor.constraint(equalTo: textInputComponentView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.TableViewConstraints.top),

            textInputComponentView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            textInputComponentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            textInputComponentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textInputComponentView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}

extension ChatView: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell", for: indexPath) as! MessageTableViewCell
        let message = messages[indexPath.row]
        cell.configure(with: message)
        return cell
    }
    
    
}

struct Message {
    let text: String
    let date: Date
}


