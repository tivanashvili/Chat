//
//  SwitcherView.swift
//  Chat App
//
//  Created by tornike on 29.04.23.
//

import UIKit

class SwitcherView: UIView {
    
    // MARK: variables
    private var modeButton = UIButton()
    var isDarkMode = false {
        didSet {
            overrideUserInterfaceStyle = isDarkMode ? .dark : .light
            updateModeButtonImage()
            NotificationCenter.default.post(name: Notification.Name("modeChanged"), object: nil, userInfo: ["isDarkMode": isDarkMode])
        }
    }
    private var modeButtonImageName = ImageNames.lightModeSwitchButton
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureModeButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureModeButton() {
        modeButton.translatesAutoresizingMaskIntoConstraints = false
        modeButton.addTarget(self, action: #selector(toggleMode), for: .touchUpInside)
        updateModeButtonImage()
        addSubview(modeButton)
    }
    
    @objc private func toggleMode() {
        isDarkMode.toggle()
    }
    
    private func updateModeButtonImage() {
        modeButtonImageName = isDarkMode ? ImageNames.darkModeSwitchButton : ImageNames.lightModeSwitchButton
        modeButton.setImage(UIImage(named: modeButtonImageName), for: .normal)
    }
}


