//
//  ChatViewModel.swift
//  Chat App
//
//  Created by tornike on 02.06.23.
//

import Foundation
import CoreData

class ChatViewModel {
    private let coreDataManager = CoreDataManger.shared
    private var messages: [Message] = []
    
    func saveMessage(userID: Int, message: String, date: Date, sendFailed: Bool) {
        let messageModel = Message(userID: userID, message: message, date: date, sendFailed: sendFailed)
        coreDataManager.saveMessage(messageModel)
        messages.append(messageModel)
    }
    
    func getAllMessages() -> [Message] {
        messages = coreDataManager.fetchAllMessages()
        return messages
    }
}
