//
//  ConversationViewControllerConstants.swift
//  Chat App
//
//  Created by tornike on 29.04.23.
//

import UIKit

extension ConversationViewController {
    enum Constants {
        enum ViewColor {
            static let darkModeColor = UIColor(
                red: 0.086,
                green: 0,
                blue: 0.224,
                alpha: 1)
        }
        enum SeparatorView{
            static let viewHeight: CGFloat = 6
            static let separatorViewColor = UIColor(
                red: 0.969,
                green: 0.808,
                blue: 0.498,
                alpha: 1)
        }
        enum TopChatViewConstraints{
            static let top: CGFloat = 16
            static let bottom: CGFloat = -30
        }
        enum userID {
            static let topChatViewUserID = 1
            static let bottomChatViewUserID = 2
        }
        static let placeholderColor = UIColor(
            red: 0.884,
            green: 0.884,
            blue: 0.884,
            alpha: 1)
        
        static let userDefaultKey = "AppTheme"
    }
}

