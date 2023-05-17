//
//  MessageCellConstants.swift
//  Chat App
//
//  Created by tornike on 15.05.23.
//

import UIKit

extension MessageTableViewCell {
    enum Constants {
        enum CellLabelConstraints {
            static let top: CGFloat = 16
            static let sides: CGFloat = 16
            static let bottom: CGFloat = -16
        }
        enum DateLabelConstraints {
            static let top: CGFloat = 4
            static let leading: CGFloat = 50
            static let bottom: CGFloat = -16
        }
        enum ChatBubbleConstraints {
            static let smallestBubbleBottom: CGFloat = -20
            static let smallestBubbleLeading: CGFloat = 20
            static let smallestBubbleHeight: CGFloat = 18
            static let smallestBubbleWidth: CGFloat = 18
            
            static let middleBubbleBottom: CGFloat = 2
            static let middleBubbleLeading: CGFloat = -4
            static let middleBubbleHeight: CGFloat = 24
            static let middleBubbleWidth: CGFloat = 24
            
            static let chatBubbleLeading: CGFloat = 40
        }
        enum FontSize {
            static let dateLabelFontSize = UIFont.systemFont(ofSize: 12)
        }
        enum ChatBubbleColors{
            static let lightModeBubbleColor = UIColor(
                red: 0.855,
                green: 0.761,
                blue: 1.0,
                alpha: 1.0
            )
        }
    }
}
