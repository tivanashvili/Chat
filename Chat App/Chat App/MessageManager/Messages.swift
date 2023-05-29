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

struct Messages {
    let userID: BubblePosition
    let message: String
    let date: Date
}
