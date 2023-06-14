//
//  ConversationViewModel.swift
//  Chat App
//
//  Created by tornike on 14.06.23.
//

import Foundation
import CoreData

class ConversationViewModel {
    
    private let coreDataManager =  CoreDataManager.shared
    private(set) var topViewModel: ChatViewModel
    private(set) var bottomViewModel: ChatViewModel
    
    init() {
        topViewModel = ChatViewModel(loggedInUserID: 1, messages: [])
        bottomViewModel = ChatViewModel(loggedInUserID: 2, messages: [])
        
        let messages = getAllMessages()
        
        topViewModel.recieveMessages(messages: messages)
        bottomViewModel.recieveMessages(messages: messages)
    }
    
    func saveMessage(message: Message) {
        coreDataManager.saveMessage(message)
        topViewModel.recieveMessage(message: message)
        bottomViewModel.recieveMessage(message: message)
    }
    
    private func getAllMessages() -> [Message] {
        return coreDataManager.fetchAllMessages()
    }
}
