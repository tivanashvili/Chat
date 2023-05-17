//
//  MessageTableViewCell.swift
//  Chat App
//
//  Created by tornike on 04.05.23.
//
import UIKit

final class MessageTableViewCell: UITableViewCell {
    
    // MARK: Components
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = Constants.FontSize.dateLabelFontSize
        return label
    }()
    
    private let chatBubble: UIView = {
        let bubble = UIView()
        bubble.layer.cornerRadius = 25
        bubble.layer.masksToBounds = true
        bubble.backgroundColor = Constants.ChatBubbleColors.lightModeBubbleColor
        return bubble
    }()
    
    private let middleBubble: UIView = {
        let bubble = UIView()
        bubble.layer.cornerRadius = 12
        bubble.layer.masksToBounds = true
        bubble.backgroundColor = Constants.ChatBubbleColors.lightModeBubbleColor
        return bubble
    }()
    
    private let smallestBubble: UIView = {
        let bubble = UIView()
        bubble.layer.cornerRadius = 10
        bubble.layer.masksToBounds = true
        bubble.backgroundColor = Constants.ChatBubbleColors.lightModeBubbleColor
        return bubble
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    private func setUp() {
        backgroundColor = .clear
        setUpChatBubbles()
        setUpMessageLabel()
        setUpDateLabel()
        setUpLayoutConstraints()
    }
    
    private func setUpChatBubbles() {
        contentView.addSubview(chatBubble)
        contentView.addSubview(middleBubble)
        contentView.addSubview(smallestBubble)
        chatBubble.translatesAutoresizingMaskIntoConstraints = false
        middleBubble.translatesAutoresizingMaskIntoConstraints = false
        smallestBubble.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpMessageLabel() {
        chatBubble.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpDateLabel() {
        contentView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configure(with message: Message) {
        messageLabel.text = message.text
        dateLabel.text = message.date.formatDate()
    }
    
    private func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            smallestBubble.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.ChatBubbleConstraints.smallestBubbleLeading),
            smallestBubble.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.ChatBubbleConstraints.smallestBubbleBottom),
            smallestBubble.widthAnchor.constraint(equalToConstant: Constants.ChatBubbleConstraints.smallestBubbleWidth),
            smallestBubble.heightAnchor.constraint(equalToConstant: Constants.ChatBubbleConstraints.smallestBubbleHeight),

            middleBubble.leadingAnchor.constraint(equalTo: chatBubble.leadingAnchor, constant: Constants.ChatBubbleConstraints.middleBubbleLeading),
            middleBubble.bottomAnchor.constraint(equalTo: chatBubble.bottomAnchor, constant: Constants.ChatBubbleConstraints.middleBubbleBottom),
            middleBubble.widthAnchor.constraint(equalToConstant: Constants.ChatBubbleConstraints.middleBubbleWidth),
            middleBubble.heightAnchor.constraint(equalToConstant: Constants.ChatBubbleConstraints.middleBubbleHeight),
            
            chatBubble.topAnchor.constraint(equalTo: contentView.topAnchor),
            chatBubble.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.ChatBubbleConstraints.chatBubbleLeading),

            messageLabel.topAnchor.constraint(equalTo: chatBubble.topAnchor, constant: Constants.CellLabelConstraints.top),
            messageLabel.leadingAnchor.constraint(equalTo: chatBubble.leadingAnchor, constant: Constants.CellLabelConstraints.sides),
            messageLabel.trailingAnchor.constraint(equalTo: chatBubble.trailingAnchor, constant: -Constants.CellLabelConstraints.sides),
            messageLabel.bottomAnchor.constraint(equalTo: chatBubble.bottomAnchor, constant: Constants.CellLabelConstraints.bottom),
            
            dateLabel.topAnchor.constraint(equalTo: chatBubble.bottomAnchor, constant: Constants.DateLabelConstraints.top),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.DateLabelConstraints.leading),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.DateLabelConstraints.bottom)
        ])
    }
}
