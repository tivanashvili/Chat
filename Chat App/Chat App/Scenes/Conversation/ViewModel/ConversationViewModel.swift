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
    
    private let coreDataManager =  CoreDataManager.shared
    
    init() {
        messages = getAllMessages()
    }
    
    func getMessages(userID: Int) -> [Message] {
        messages.filter { isMessageValid(message: $0, userID: userID) }
    }
    
    func saveMessage(message: Message) {
        messages.append(message)
        coreDataManager.saveMessage(message)
    }
    
    private func getAllMessages() -> [Message] {
        coreDataManager.fetchAllMessages()
    }
    
    private func isMessageValid (message: Message, userID: Int) -> Bool {
        !message.sendFailed || message.userID == userID
    }
}
