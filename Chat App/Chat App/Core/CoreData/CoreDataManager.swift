//
//  CoreDataManager.swift
//  Chat App
//
//  Created by tornike on 05.06.23.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    private let coreDataStack = CoreDataStack.shared
    
    private init() {}
    
    func saveMessage(_ message: Message) {
        coreDataStack.viewContext.perform {
            guard let entity = NSEntityDescription.insertNewObject(forEntityName: "MessageEntity", into: self.coreDataStack.viewContext) as? MessageEntity else {
                return
            }
            
            entity.userID = Int32(message.userID)
            entity.message = message.message
            entity.date = message.date
            entity.sendFailed = message.sendFailed
            
            self.coreDataStack.saveContext()
        }
    }
    
    func fetchAllMessages() -> [Message] {
        let fetchRequest: NSFetchRequest<MessageEntity> = MessageEntity.fetchRequest()
        
        do {
            let result = try coreDataStack.viewContext.fetch(fetchRequest)
            return result.map { messageEntity in
                let userID = Int(messageEntity.userID)
                let message = messageEntity.message ?? ""
                let date = messageEntity.date ?? Date()
                let sendFailed = messageEntity.sendFailed
                
                return Message(userID: userID, message: message, date: date, sendFailed: sendFailed)
            }
        } catch {
            print("Failed to fetch messages: \(error)")
            return []
        }
    }
}


