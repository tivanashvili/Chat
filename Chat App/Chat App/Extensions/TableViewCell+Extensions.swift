//
//  TableViewCell+Extensions.swift
//  Chat App
//
//  Created by tornike on 15.05.23.
//

import Foundation

extension Date {
        func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
}
