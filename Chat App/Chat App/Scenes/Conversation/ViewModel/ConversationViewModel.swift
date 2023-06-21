//
//  ConversationViewModel.swift
//  Chat App
//
//  Created by tornike on 14.06.23.
//

import Foundation
import CoreData

class ConversationViewModel {
    private var messages: [Message] = []
    private let loggedInUserID: Int = 1
    private let coreDataManager =  CoreDataManager.shared
    
    init() {
        messages = getAllMessages()
    }
    
    func getMessages() -> [Message] {
        messages.filter(isMessageValid)
    }
    
    func saveMessage(message: Message) {
        messages.append(message)
        coreDataManager.saveMessage(message)
    }
    
    private func getAllMessages() -> [Message] {
        return coreDataManager.fetchAllMessages()
    }
    
    private func isMessageValid (message: Message) -> Bool {
        return !message.sendFailed || message.userID == loggedInUserID
    }
}
