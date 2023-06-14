//
//  ChatViewModel.swift
//  Chat App
//
//  Created by tornike on 12.06.23.
//

import Foundation

class ChatViewModel {
    let loggedInUserID: Int
    var messages: [Message]
    
    init(loggedInUserID: Int, messages: [Message]){
        self.loggedInUserID = loggedInUserID
        self.messages = messages
    }
    
    func recieveMessage(message: Message) {
        if isMessageValid(message: message) {
            messages.append(message)
        }
    }
    
    func recieveMessages(messages: [Message]) {
        self.messages.append(contentsOf: messages.filter(isMessageValid))
    }
    
    private func isMessageValid (message: Message) -> Bool {
        return !message.sendFailed || message.userID == loggedInUserID
    }
}
