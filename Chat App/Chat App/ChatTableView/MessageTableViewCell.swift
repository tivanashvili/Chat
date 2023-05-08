//
//  MessageTableViewCell.swift
//  Chat App
//
//  Created by tornike on 04.05.23.
//
import UIKit

class MessageTableViewCell: UITableViewCell {
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
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
    
    private func setUp() {
        setUpMessageLabel()
        setUpDateLabel()
        setUpLayoutConstraints()
    }
    
    private func setUpMessageLabel() {
        contentView.addSubview(messageLabel)
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        messageLabel.textColor = .black
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpDateLabel() {
        contentView.addSubview(dateLabel)
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        dateLabel.textColor = .gray
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configure(with message: Message) {
        messageLabel.text = message.text
        dateLabel.text = formatDate(message.date)
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
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


