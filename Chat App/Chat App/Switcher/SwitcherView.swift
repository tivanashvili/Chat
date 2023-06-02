//
//  SwitcherView.swift
//  Chat App
//
//  Created by tornike on 29.04.23.
//

import UIKit

enum BackgroundMode {
    case light
    case dark
}

protocol DayLightSwitchDelegate: AnyObject {
    func didToggleSwitch(with state: BackgroundMode)
}

final class DayLightSwitch: UIButton {
    
    // MARK: Components
    weak var delegate: DayLightSwitchDelegate?
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    private func setUp() {
        setImage(Constants.lightMode, for: .normal)
        setImage(Constants.darkMode, for: .selected)
        addAction(UIAction(handler: { [weak self] _ in self?.buttonTapped()}), for: .touchUpInside)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func buttonTapped() {
        isSelected.toggle()
        delegate?.didToggleSwitch(with: isSelected ? .dark : .light)
    }
}
