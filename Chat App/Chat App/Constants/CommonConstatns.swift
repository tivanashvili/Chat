//
//  CommonConstatns.swift
//  Chat App
//
//  Created by tornike on 29.04.23.
//

import UIKit

enum Constants {
    enum SeparatorView{
        static let viewHeight: CGFloat = 6
    }
    enum TextView {
        static let placeHolder = "დაწერე შეტყობინება..."
    }
    enum ImageNames {
        static let SendButton = "sendButtonImage"
        static let lightModeSwitchButton = "lightModeSwitch"
        static let darkModeSwitchButton = "darkModeSwitch"
    }
    enum ChatAppColors {
        static let darkModeColor = UIColor(
            red: 0.086,
            green: 0,
            blue: 0.224,
            alpha: 1)
        static let separatorViewColor = UIColor(
            red: 0.969,
            green: 0.808,
            blue: 0.498,
            alpha: 1)
        static let containerViewBorderColor = UIColor(
            red: 0.624,
            green: 0.376,
            blue: 1,
            alpha: 1)
        static let lightModeTextColor = UIColor(
            red: 0.098,
            green: 0.098,
            blue: 0.098,
            alpha: 1)
        static let darkModeTextColor = UIColor(
            red: 0.945,
            green: 0.945,
            blue: 0.945,
            alpha: 1)
        static let placeholderColor = UIColor(
            red: 0.884,
            green: 0.884,
            blue: 0.884,
            alpha: 1)
    }
    enum TableViewConstraints{
        static let top: CGFloat = 5
    }
    enum ContainerViewConstraints{
        static let height: CGFloat = 56
        static let side: CGFloat = 16
    }
    enum TextViewConstraints{
        static let side: CGFloat = -5
    }
    enum ButtonConstraints{
        static let bottom: CGFloat = -12
        static let trailing: CGFloat = -12
        static let height: CGFloat = 32
        static let width: CGFloat = 32
    }
    enum CellLabelConstraints{
        static let top: CGFloat = 8
        static let sides: CGFloat = 16
    }
    enum DateLabelConstraints{
        static let top: CGFloat = 4
        static let sides: CGFloat = 16
        static let bottom: CGFloat = -8
    }
    enum TopChatViewConstraints{
        static let top: CGFloat = 16
        static let bottom: CGFloat = -30
    }
}


