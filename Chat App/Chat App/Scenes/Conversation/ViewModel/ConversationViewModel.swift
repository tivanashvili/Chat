//
//  ConversationViewModel.swift
//  Chat App
//
//  Created by tornike on 14.06.23.
//

import Foundation
import CoreData

class ConversationViewModel {
    
    private let coreDataManager = CoreDataManger.shared
    private var messages: [Message] = []
    
    func saveMessage(message: Message) {
        coreDataManager.saveMessage(message)
        messages.append(message)
    }
    
    func getAllMessages() -> [Message] {
        messages = coreDataManager.fetchAllMessages()
        return messages
    }
}
