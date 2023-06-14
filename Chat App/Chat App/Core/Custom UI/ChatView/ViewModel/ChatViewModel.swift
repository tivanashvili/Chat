//
//  ChatViewModel.swift
//  Chat App
//
//  Created by tornike on 12.06.23.
//

import Foundation

protocol ChatViewModelDelegate: AnyObject {
    func didUpdateMessages()
}

struct ChatViewModel {
    var loggedInUserID: Int
    var messages: [Message]
    
    weak var delegate: ChatViewModelDelegate?
    
    mutating func addMessage(message: Message) {
        messages.append(message)
        delegate?.didUpdateMessages()
    }
}
