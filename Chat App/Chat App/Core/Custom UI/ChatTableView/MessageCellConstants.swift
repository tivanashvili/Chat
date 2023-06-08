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
        enum DateConfigure {
            static let date = "MMM MM, HH:mm"
        }
        enum SendFailedText {
            static let text = "არ გაიგზავნა"
        }
        enum ChatBubbleConstraints {
            static let smallestBubbleBottom: CGFloat = -20
            static let smallestBubbleLeading: CGFloat = 20
            static let smallestBubbleTrailing: CGFloat = -20
            static let smallestBubbleHeight: CGFloat = 18
            static let smallestBubbleWidth: CGFloat = 18
            static let smallestBubbleCornerRadius: CGFloat = 10
            
            static let middleBubbleBottom: CGFloat = 2
            static let middleBubbleLeading: CGFloat = -4
            static let middleBubbleHeight: CGFloat = 24
            static let middleBubbleWidth: CGFloat = 24
            static let middleBubbleCornerRadius: CGFloat = 12
            
            static let chatBubbleLeading: CGFloat = 40
            static let chatBubbleTrailing: CGFloat = -16
            static let chatBubbleCornerRadius: CGFloat = 25
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
            static let receiverBubbleColor = UIColor(
                red: 241/255,
                green: 241/255,
                blue: 241/255,
                alpha: 1
            )
        }
        enum SenderSmallBubbleConstraints {
            static let topAnchor: CGFloat = -5
            static let trailing: CGFloat = -10
            static let backgroundColor = UIColor(red: 218/255, green: 194/255, blue: 255/255, alpha: 1)
        }
        enum SenderMiddleBubbleConstraints {
            static let trailing: CGFloat = 4
            static let bottom: CGFloat = 4
            static let width: CGFloat = 22
            static let height: CGFloat = 22
            static let backgroundColor = UIColor(red: 218/255, green: 194/255, blue: 255/255, alpha: 1)
        }
        enum SenderChatBubbleConstraints {
            static let top: CGFloat = 5
            static let trailing: CGFloat = -30
            static let bottom: CGFloat = 16
            static let backgroundColor = UIColor(red: 218/255, green: 194/255, blue: 255/255, alpha: 1)
        }
        enum SenderMessageLabelConstraints {
            static let top: CGFloat = 16
            static let bottom: CGFloat = 16
            static let leading: CGFloat = 16
            static let trailing: CGFloat = -16
        }
        enum SenderDateLabelConstraints {
            static let top: CGFloat = 5
            static let trailing: CGFloat = -55
            static let bottom: CGFloat = -16
        }
        enum RecieverColor {
            static let backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1.0)
        }
    }
}
