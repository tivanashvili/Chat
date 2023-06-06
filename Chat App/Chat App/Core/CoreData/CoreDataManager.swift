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
    let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext

    func fetchMessages() -> [Message] {
        var messages = [Message]()
        do {
            let fetchRequest: NSFetchRequest<MessageEntity> = MessageEntity.fetchRequest()
            let messageEntities = try context.fetch(fetchRequest)
            
            messages = messageEntities.map { messageEntity in
                let message = Message(
                    userID: Int(messageEntity.userID),
                    message: messageEntity.message ?? "",
                    date: messageEntity.date ?? Date()
                )
                return message
            }
        } catch let error as NSError {
            print("Failed to fetch messages: \(error)")
        }
        return messages
    }


    func saveMessage(userID: Int32, message: String, date: Date) {
        let messageEntity = MessageEntity(context: context)
        messageEntity.userID = userID
        messageEntity.message = message
        messageEntity.date = date

        do {
            try context.save()
            AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
            print("message saved")
        } catch let error as NSError {
            print("Failed to save message: \(error), \(error.userInfo)")
        }
    }
}
