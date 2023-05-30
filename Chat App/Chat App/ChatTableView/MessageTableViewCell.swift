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
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = Constants.FontSize.dateLabelFontSize
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let chatBubble: UIView = {
        let bubble = UIView()
        bubble.layer.cornerRadius = Constants.ChatBubbleConstraints.chatBubbleCornerRadius
        bubble.layer.masksToBounds = true
        bubble.backgroundColor = Constants.ChatBubbleColors.receiverBubbleColor
        bubble.translatesAutoresizingMaskIntoConstraints = false
        return bubble
    }()
    
    private let middleBubble: UIView = {
        let bubble = UIView()
        bubble.layer.cornerRadius = Constants.ChatBubbleConstraints.middleBubbleCornerRadius
        bubble.layer.masksToBounds = true
        bubble.backgroundColor = Constants.ChatBubbleColors.receiverBubbleColor
        bubble.translatesAutoresizingMaskIntoConstraints = false
        return bubble
    }()
    
    private let smallestBubble: UIView = {
        let bubble = UIView()
        bubble.layer.cornerRadius = Constants.ChatBubbleConstraints.smallestBubbleCornerRadius
        bubble.layer.masksToBounds = true
        bubble.backgroundColor = Constants.ChatBubbleColors.receiverBubbleColor
        bubble.translatesAutoresizingMaskIntoConstraints = false
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
        selectionStyle = .none
        backgroundColor = .clear
        setUpBubbles()
        setUpMessageLabel()
    }
    
    private func setUpRecieverBubbleConstraints() {
        setUpRecieverChatBubble()
        setUpRecieverSmallestBubble()
        setUpRecieverMiddleBubble()
        setUpMessageLabel()
        setUpDateLabel()
    }
    
    private func setUpBubbles() {
        contentView.addSubview(chatBubble)
        contentView.addSubview(middleBubble)
        contentView.addSubview(smallestBubble)
        contentView.addSubview(dateLabel)
    }
    
    private func setUpRecieverChatBubble() {
        NSLayoutConstraint.activate([
            chatBubble.topAnchor.constraint(equalTo: contentView.topAnchor),
            chatBubble.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.ChatBubbleConstraints.chatBubbleLeading),
            chatBubble.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: Constants.ChatBubbleConstraints.chatBubbleTrailing)
        ])
    }
    
    private func setUpRecieverMiddleBubble() {
        NSLayoutConstraint.activate([
            middleBubble.leadingAnchor.constraint(equalTo: chatBubble.leadingAnchor, constant: Constants.ChatBubbleConstraints.middleBubbleLeading),
            middleBubble.bottomAnchor.constraint(equalTo: chatBubble.bottomAnchor, constant: Constants.ChatBubbleConstraints.middleBubbleBottom),
            middleBubble.widthAnchor.constraint(equalToConstant: Constants.ChatBubbleConstraints.middleBubbleWidth),
            middleBubble.heightAnchor.constraint(equalToConstant: Constants.ChatBubbleConstraints.middleBubbleHeight)
        ])
    }
    
    private func setUpRecieverSmallestBubble() {
        NSLayoutConstraint.activate([
            smallestBubble.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.ChatBubbleConstraints.smallestBubbleLeading),
            smallestBubble.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.ChatBubbleConstraints.smallestBubbleBottom),
            smallestBubble.widthAnchor.constraint(equalToConstant: Constants.ChatBubbleConstraints.smallestBubbleWidth),
            smallestBubble.heightAnchor.constraint(equalToConstant: Constants.ChatBubbleConstraints.smallestBubbleHeight)
        ])
    }
    
    private func setUpMessageLabel() {
        chatBubble.addSubview(messageLabel)
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: chatBubble.topAnchor, constant: Constants.CellLabelConstraints.top),
            messageLabel.leadingAnchor.constraint(equalTo: chatBubble.leadingAnchor, constant: Constants.CellLabelConstraints.sides),
            messageLabel.trailingAnchor.constraint(equalTo: chatBubble.trailingAnchor, constant: -Constants.CellLabelConstraints.sides),
            messageLabel.bottomAnchor.constraint(equalTo: chatBubble.bottomAnchor, constant: Constants.CellLabelConstraints.bottom)
        ])
    }
    
    private func setUpDateLabel() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: chatBubble.bottomAnchor, constant: Constants.DateLabelConstraints.top),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.DateLabelConstraints.leading),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.DateLabelConstraints.bottom)
        ])
    }
    
    private func setUpSenderBubbleConstraints() {
        setUpSenderSmallBubbleConstraints()
        setUpSenderMiddleBubbleConstraints()
        setUpSenderChatBubbleConstraints()
        setUpRightMessageLabelConstraints()
        setUpRightDateLabelConstraints()
    }
    
    private func setUpSenderBubbleColor() {
        chatBubble.backgroundColor = Constants.SenderChatBubbleConstraints.backgroundColor
        middleBubble.backgroundColor = Constants.SenderChatBubbleConstraints.backgroundColor
        smallestBubble.backgroundColor = Constants.SenderChatBubbleConstraints.backgroundColor
    }
    
    private func setUpSenderSmallBubbleConstraints() {
        NSLayoutConstraint.activate([
            smallestBubble.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.SenderSmallBubbleConstraints.trailing),
            smallestBubble.topAnchor.constraint(equalTo: middleBubble.bottomAnchor, constant: Constants.SenderSmallBubbleConstraints.topAnchor),
            smallestBubble.widthAnchor.constraint(equalToConstant: Constants.ChatBubbleConstraints.smallestBubbleWidth),
            smallestBubble.heightAnchor.constraint(equalToConstant: Constants.ChatBubbleConstraints.smallestBubbleHeight)
        ])
    }
    
    private func setUpSenderMiddleBubbleConstraints() {
        NSLayoutConstraint.activate([
            middleBubble.trailingAnchor.constraint(equalTo: chatBubble.trailingAnchor, constant: Constants.SenderMiddleBubbleConstraints.trailing),
            middleBubble.bottomAnchor.constraint(equalTo: chatBubble.bottomAnchor, constant: Constants.SenderMiddleBubbleConstraints.bottom),
            middleBubble.widthAnchor.constraint(equalToConstant: Constants.ChatBubbleConstraints.middleBubbleWidth),
            middleBubble.heightAnchor.constraint(equalToConstant: Constants.ChatBubbleConstraints.middleBubbleHeight)
        ])
    }
    
    private func setUpSenderChatBubbleConstraints() {
        NSLayoutConstraint.activate([
            chatBubble.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.SenderChatBubbleConstraints.top),
            chatBubble.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.SenderChatBubbleConstraints.trailing),
            chatBubble.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: Constants.SenderChatBubbleConstraints.bottom),
            chatBubble.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: -Constants.ChatBubbleConstraints.chatBubbleTrailing)
        ])
    }
    
    private func setUpRightMessageLabelConstraints() {
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: chatBubble.topAnchor, constant: Constants.SenderMessageLabelConstraints.top),
            messageLabel.trailingAnchor.constraint(equalTo: chatBubble.trailingAnchor, constant: Constants.SenderMessageLabelConstraints.trailing),
            messageLabel.bottomAnchor.constraint(equalTo: chatBubble.bottomAnchor, constant: Constants.SenderMessageLabelConstraints.bottom),
            messageLabel.leadingAnchor.constraint(equalTo: chatBubble.leadingAnchor, constant: Constants.SenderMessageLabelConstraints.leading)
        ])
        messageLabel.textAlignment = .right
    }
    
    private func setUpRightDateLabelConstraints() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: chatBubble.bottomAnchor, constant: Constants.SenderDateLabelConstraints.top),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.SenderDateLabelConstraints.trailing),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.SenderDateLabelConstraints.bottom),
        ])
    }
    
    func configure(with message: Message, bubblePosition: BubblePosition) {
        messageLabel.text = message.message
        dateLabel.text = message.date.formatDate(dateFormat: Constants.DateConfigure.date)
        
        switch bubblePosition {
        case .left:
            setUpRecieverBubbleConstraints()
        case .right:
            setUpSenderBubbleConstraints()
            setUpSenderBubbleColor()
        }
    }
}
