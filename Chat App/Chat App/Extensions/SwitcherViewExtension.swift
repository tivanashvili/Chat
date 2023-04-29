//
//  SwitcherViewExtension.swift
//  Chat App
//
//  Created by tornike on 29.04.23.
//

import UIKit

extension ViewController {
    override var overrideUserInterfaceStyle: UIUserInterfaceStyle {
        get {
            return switcherView.isDarkMode ? .dark : .light
        }
        set {}
    }
}

