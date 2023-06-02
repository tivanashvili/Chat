//
//  TextInputViewConstants.swift
//  Chat App
//
//  Created by tornike on 15.05.23.
//

import UIKit

extension TextInputComponentView {
    enum Constants {
        enum Button {
            static let bottom: CGFloat = -12
            static let trailing: CGFloat = -12
            static let height: CGFloat = 32
            static let width: CGFloat = 32
            static let borderWidth: CGFloat = 1
            static let cornerRadius: CGFloat = 28
        }
        enum TextView {
            static let height: CGFloat = 114
            static let side: CGFloat = -5
            static let placeHolder = "დაწერე შეტყობინება..."
            static let sendButton = "sendButtonImage"
            static let maxLines = 5
            static let fontSize: CGFloat = 16
            static let lightModeTextColor = UIColor(
                red: 0.098,
                green: 0.098,
                blue: 0.098,
                alpha: 1)
            static let placeholderColor = UIColor(
                red: 0.884,
                green: 0.884,
                blue: 0.884,
                alpha: 1)
        }
        enum ContainerView {
            static let height: CGFloat = 126
            static let side: CGFloat = 16
            static let containerViewBorderColor = UIColor(
                red: 0.624,
                green: 0.376,
                blue: 1,
                alpha: 1).cgColor
        }
        enum TextViewInsets {
            static let textInsets = UIEdgeInsets(top: 19, left: 22, bottom: 19, right: 0)
        }
    }
}
