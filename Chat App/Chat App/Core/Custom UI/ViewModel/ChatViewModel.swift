//
//  ChatViewModel.swift
//  Chat App
//
//  Created by tornike on 02.06.23.
//

import Foundation
import CoreData

final class ChatViewModel {

    private (set) var messages = [Message]() {
        didSet {
            reloadTableView?()
        }
    }

    var reloadTableView:(() -> ())?
    let coreDataManager = CoreDataManager.shared

    func createMessage(message: Message) {
        coreDataManager.saveMessage(userID: Int32(message.userID), message: message.message, date: message.date)
        DispatchQueue.main.async {
            self.fetchMessage()
            print(self.messages)
        }
    }

    private func fetchMessage() {
        messages = coreDataManager.fetchMessages()
    }
}
