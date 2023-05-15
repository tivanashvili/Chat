//
//  TextInputComponentViewModel.swift
//  Chat App
//
//  Created by tornike on 29.04.23.
//

import UIKit

final class TextInputComponentView: UIView {
    
    // MARK: Components
    private let containerView = UIView()
    private let textView = UITextView()
    private let button = UIButton()
    private var containerViewHeightConstraint: NSLayoutConstraint?
    
    // MARK: Init
    init() {
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    private func setUp() {
        setUpContainerView()
        setUpTextView()
        setUpButton()
        setUpLayoutConstraints()
    }
    
    private func setUpContainerView() {
        containerView.layer.borderWidth = Constants.Button.borderWidth
        containerView.layer.borderColor = Constants.ContainerView.containerViewBorderColor
        containerView.layer.cornerRadius = Constants.Button.cornerRadius
        containerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpTextView() {
        textView.text = Constants.TextView.placeHolder
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isEditable = true
        textView.textColor = Constants.TextView.placeholderColor
        textView.delegate = self
        textView.contentOffset = CGPoint(x: 0, y: (textView.contentSize.height - textView.frame.height) / 2)
        textView.textContainerInset = UIEdgeInsets(top: 19, left: 22, bottom: 19, right: 0)
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.adjustsFontForContentSizeCategory = true
        textView.backgroundColor = .clear
        containerView.addSubview(textView)
    }
    
    private func setUpButton() {
        button.setImage(UIImage(named: Constants.TextView.sendButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(button)
    }
    
    // MARK: Layout Constraints
    private func setUpLayoutConstraints() {
        addSubview(containerView)
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: Constants.ContainerView.height)
        containerViewHeightConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.ContainerView.side),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.ContainerView.side),
            
            textView.topAnchor.constraint(equalTo: containerView.topAnchor),
            textView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: Constants.TextView.side),
            
            button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.Button.bottom),
            button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: Constants.Button.trailing),
            button.heightAnchor.constraint(equalToConstant: Constants.Button.height),
            button.widthAnchor.constraint(equalToConstant: Constants.Button.width),
        ])
    }
    
    private func updateTextViewHeight() {
        let maxLines = textView.calculateMaxLines()
        if maxLines > 4 {
            guard containerViewHeightConstraint == nil else { return }
            containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: containerView.frame.height)
            containerViewHeightConstraint?.isActive = true
            textView.isScrollEnabled = true
        } else {
            textView.isScrollEnabled = false
            if let heightConstraint = containerViewHeightConstraint {
                heightConstraint.isActive = false
                containerView.removeConstraint(heightConstraint)
                containerView.layoutIfNeeded()
                textView.layoutIfNeeded()
                layoutIfNeeded()
            }
            containerViewHeightConstraint = nil
        }
    }
}

extension TextInputComponentView: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == Constants.TextView.placeholderColor {
            textView.text = ""
            textView.textColor = Constants.TextView.lightModeTextColor
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = Constants.TextView.placeHolder
            textView.textColor = Constants.TextView.placeholderColor
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        updateTextViewHeight()
    }
}

extension UITextView {
    
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: self.frame.width, height: CGFloat(Float.infinity))
        let font = self.font ?? .systemFont(ofSize: 16)
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height / charSize))
        return linesRoundedUp
    }
}




