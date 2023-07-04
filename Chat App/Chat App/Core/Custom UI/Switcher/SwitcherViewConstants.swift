//
//  SwitcherViewConstants.swift
//  Chat App
//
//  Created by tornike on 10.05.23.
//

import UIKit

extension DayLightSwitch {
    enum Constants {
        static let lightMode = UIImage(named: "lightModeSwitch")
        static let darkMode = UIImage(named: "darkModeSwitch")
        static let darkModeColor = UIColor(
            red: 0.086,
            green: 0,
            blue: 0.224,
            alpha: 1)
        static let width: CGFloat = 54
        static let height: CGFloat = 27
        static let top: CGFloat = 8
        static let trailing: CGFloat = -12
    }
}
