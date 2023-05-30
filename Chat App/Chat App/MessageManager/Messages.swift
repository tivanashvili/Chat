//
//  Messages.swift
//  Chat App
//
//  Created by tornike on 04.05.23.
//

import UIKit

enum BubblePosition {
    case left
    case right
}
struct ReceivedData {
    let loggedInUserID: Int
    let messages: [Message]
}

struct Message {
    let userID: Int
    let message: String
    let date: Date
}
