//
//  ChatView.swift
//  ChatAppV2
//
//  Created by tornike on 26.04.23.
//

import UIKit

final class ChatView: UIView {

    private let chatView = UIView()
    private let messageTableView = MessageTableView()
    private let textInputComponentView = TextInputComponentView(frame: CGRect(), textInputComponentModel: TextInputComponentViewModel(placeHolder: CommonConstants.MessageComponentPlaceHolder, sendButtonImageName: ImageNames.SendButton))

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
        setUpMessageTableView()
        setUpTextInputComponentView()
        setUpLayoutConstraints()
    }

    private func setUpChatView(){
        chatView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setUpMessageTableView(){
        messageTableView.translatesAutoresizingMaskIntoConstraints = false
        chatView.addSubview(messageTableView)
    }

    private func setUpTextInputComponentView(){
        textInputComponentView.translatesAutoresizingMaskIntoConstraints = false
        chatView.addSubview(textInputComponentView)
    }

    // MARK : layout constraints
    private func setUpLayoutConstraints(){
        addSubview(chatView)
        NSLayoutConstraint.activate([
            chatView.topAnchor.constraint(equalTo: topAnchor),
            chatView.leadingAnchor.constraint(equalTo: leadingAnchor),
            chatView.bottomAnchor.constraint(equalTo: bottomAnchor),
            chatView.trailingAnchor.constraint(equalTo: trailingAnchor),

            messageTableView.topAnchor.constraint(equalTo: chatView.topAnchor, constant: 5),
            messageTableView.bottomAnchor.constraint(equalTo: textInputComponentView.topAnchor),
            messageTableView.leadingAnchor.constraint(equalTo: chatView.leadingAnchor, constant: 5),
            messageTableView.trailingAnchor.constraint(equalTo: chatView.trailingAnchor, constant: -5),

            textInputComponentView.topAnchor.constraint(equalTo: messageTableView.bottomAnchor),
            textInputComponentView.bottomAnchor.constraint(equalTo: chatView.bottomAnchor),
            textInputComponentView.trailingAnchor.constraint(equalTo: chatView.trailingAnchor),
            textInputComponentView.leadingAnchor.constraint(equalTo: chatView.leadingAnchor)
        ])
    }
}


