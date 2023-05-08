//
//  SwitcherView.swift
//  Chat App
//
//  Created by tornike on 29.04.23.
//

import UIKit

protocol DayLightSwitchDelegate: AnyObject {
    func didToggleDayLightSwitch(isOn: Bool)
}

class DayLightSwitch: UIButton {
    
    // MARK: Components
    
    private let button = UIButton(type: .system)
    private let dayImage = UIImage(named: Constants.ImageNames.lightModeSwitchButton)
    private let nightImage = UIImage(named: Constants.ImageNames.darkModeSwitchButton)
    private var isOn:Bool = false
    
    weak var delegate: DayLightSwitchDelegate!
    
    // MARK: Init
    
    init(isOn: Bool) {
        super.init(frame: .zero)
        self.isOn = isOn
        configureButton()
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configureButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        setButtonImage()
    }
    
    private func addSubviews() {
        addSubview(button)
    }
    
    @objc private func buttonTapped() {
        isOn = !isOn
        setButtonImage()
        delegate.didToggleDayLightSwitch(isOn: isOn)
    }
    
    private func setButtonImage(){
        button.setImage(!isOn ? dayImage : nightImage, for: .normal)
    }
}


