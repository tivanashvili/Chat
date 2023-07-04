//
//  Date+Extension.swift
//  Chat App
//
//  Created by tornike on 24.05.23.
//

import Foundation

extension Date {
    func formatDate(dateFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: self)
    }
}
