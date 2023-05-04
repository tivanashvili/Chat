//
//  ChatView.swift
//  ChatAppV2
//
//  Created by tornike on 26.04.23.
//

import UIKit

final class ChatView: UIView {
    
    //MARK: variables
    
    private let chatView = UIView()
    private let textInputComponentView = TextInputComponentView(frame: CGRect(), textInputComponentModel: TextInputComponentViewModel(placeHolder: CommonConstants.MessageComponentPlaceHolder, sendButtonImageName: ImageNames.SendButton))
    public var data = ["item1", "item2", "item3"]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: "MessageTableViewCell")
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
        chatView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setUpTextInputComponentView(){
        textInputComponentView.translatesAutoresizingMaskIntoConstraints = false
        chatView.addSubview(textInputComponentView)
    }
    
    private func setUpTableView() {
        chatView.addSubview(tableView)
    }

    // MARK : layout constraints
    private func setUpLayoutConstraints(){
        addSubview(chatView)
        NSLayoutConstraint.activate([
            chatView.topAnchor.constraint(equalTo: topAnchor),
            chatView.leadingAnchor.constraint(equalTo: leadingAnchor),
            chatView.bottomAnchor.constraint(equalTo: bottomAnchor),
            chatView.trailingAnchor.constraint(equalTo: trailingAnchor),

            tableView.topAnchor.constraint(equalTo: chatView.topAnchor, constant: 5),
            tableView.bottomAnchor.constraint(equalTo: textInputComponentView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: chatView.leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: chatView.trailingAnchor, constant: -5),

            textInputComponentView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            textInputComponentView.bottomAnchor.constraint(equalTo: chatView.bottomAnchor),
            textInputComponentView.trailingAnchor.constraint(equalTo: chatView.trailingAnchor),
            textInputComponentView.leadingAnchor.constraint(equalTo: chatView.leadingAnchor)
        ])
    }
}

extension ChatView: UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell", for: indexPath) as! MessageTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected item \(indexPath.row + 1)")
    }
    
    
    
}


