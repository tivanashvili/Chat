//
//  ChatTableView.swift
//  ChatAppV2
//
//  Created by tornike on 26.04.23.
//

import UIKit

class ChatBubbleView: UIView {
    let cornerRadius: CGFloat = 25
    let bubbleColor = UIColor.gray

    override func draw(_ rect: CGRect) {
        let mainTextBubble = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        bubbleColor.setFill()
        mainTextBubble.fill()
    }
}

class SenderChatBubbleView: ChatBubbleView {
    override var bounds: CGRect {
        get { return CGRect(x: 0, y: 0, width: 200, height: 100) }
        set { }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let firstBubbleRect = CGRect(x: bounds.maxX - 10, y: bounds.maxY - 15, width: 20, height: 20)
        let firstBubble = UIBezierPath(ovalIn: firstBubbleRect)
        bubbleColor.setFill()
        firstBubble.fill()
        
        let secondBubbleRect = CGRect(x: bounds.maxX + 10, y: bounds.maxY, width: 10, height: 10)
        let secondBubble = UIBezierPath(ovalIn: secondBubbleRect)
        bubbleColor.setFill()
        secondBubble.fill()
    }
}

class ReceiverChatBubbleView: ChatBubbleView {
    override var bounds: CGRect {
        get { return CGRect(x: 0, y: 0, width: 200, height: 150) }
        set { }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let firstBubbleRect = CGRect(x: bounds.minX - 5, y: bounds.maxY - 18, width: 20, height: 20)
        let firstBubble = UIBezierPath(ovalIn: firstBubbleRect)
        bubbleColor.setFill()
        firstBubble.fill()
        
        let secondBubbleRect = CGRect(x: bounds.minX - 16, y: bounds.maxY - 3, width: 10, height: 10)
        let secondBubble = UIBezierPath(ovalIn: secondBubbleRect)
        bubbleColor.setFill()
        secondBubble.fill()
    }
}

class ChatBubbleTableViewCell: UITableViewCell {
    let chatBubbleView: ChatBubbleView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        if reuseIdentifier == "SenderCell" {
            chatBubbleView = SenderChatBubbleView()
        } else {
            chatBubbleView = ReceiverChatBubbleView()
        }
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(chatBubbleView)
        
        chatBubbleView.translatesAutoresizingMaskIntoConstraints = false
        chatBubbleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        chatBubbleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        
        if reuseIdentifier == "SenderCell" {
            chatBubbleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        } else {
            chatBubbleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//class MessageTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
//    
//    let data: [String]
//    
//    override init(frame: CGRect, style: UITableView.Style) {
//        data = ["Item 1", "Item 2", "Item 3"]
//        
//        super.init(frame: .zero, style: style)
//        
//        dataSource = self
//        delegate = self
//        register(ChatBubbleTableViewCell.self, forCellReuseIdentifier: "ChatBubbleTableViewCell")
//        separatorStyle = .none
//        
//        backgroundColor = .green
//        
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatBubbleTableViewCell", for: indexPath) as! ChatBubbleTableViewCell
//        cell.textLabel?.text = data[indexPath.row]
//        let chatMessage = ChatMessage(text: data[indexPath.row], isFromSender: true) // Replace this with your own logic to determine if the message is from the sender or receiver.
//        if chatMessage.isFromSender {
//            cell.chatBubbleView.removeFromSuperview()
//            let senderBubbleView = SenderChatBubbleView()
//            cell.contentView.addSubview(senderBubbleView)
//            // Configure constraints as desired
//        } else {
//            cell.chatBubbleView.removeFromSuperview()
//            let receiverBubbleView = ReceiverChatBubbleView()
//            cell.contentView.addSubview(receiverBubbleView)
//            // Configure constraints as desired
//        }
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Selected item \(indexPath.row + 1)")
//    }
//}



class ChatMessage {
    let text: String
    let isFromSender: Bool
    
    init(text: String, isFromSender: Bool) {
        self.text = text
        self.isFromSender = isFromSender
    }
}

class MessageTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var data: [String]
    
    override init(frame: CGRect, style: UITableView.Style) {
        data = ["Item 1", "Item 2", "Item 3"]
        
        super.init(frame: .zero, style: style)
        
        dataSource = self
        delegate = self
        
        register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected item \(indexPath.row + 1)")
    }
}

