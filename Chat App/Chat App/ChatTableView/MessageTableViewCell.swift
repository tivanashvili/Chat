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
        label.numberOfLines = .zero
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
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
        setUpMessageLabel()
        setUpDateLabel()
        setUpLayoutConstraints()
        backgroundColor = .clear
    }
    
    private func setUpMessageLabel() {
        contentView.addSubview(messageLabel)
        messageLabel.numberOfLines = .zero
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        messageLabel.textColor = .gray
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpDateLabel() {
        contentView.addSubview(dateLabel)
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .gray
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configure(with message: Message) {
        messageLabel.text = message.text
        dateLabel.text = message.date.formatDate()
    }

    private func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.CellLabelConstraints.top),
            messageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.CellLabelConstraints.sides),
            messageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.CellLabelConstraints.sides),

            dateLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: Constants.DateLabelConstraints.top),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.DateLabelConstraints.sides),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.DateLabelConstraints.sides),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.DateLabelConstraints.bottom)
        ])
    }
}

