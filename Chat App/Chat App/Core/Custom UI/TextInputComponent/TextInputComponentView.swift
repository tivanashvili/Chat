//
//  TextInputComponentViewModel.swift
//  Chat App
//
//  Created by tornike on 29.04.23.
//

import UIKit

protocol TextInputComponentViewDelegate: AnyObject {
    func didTapButton(text: String)
}

final class TextInputComponentView: UIView {
    
    // MARK: Components
    private var containerViewHeightConstraint: NSLayoutConstraint?
    
    weak var delegate: TextInputComponentViewDelegate?
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isEditable = true
        textView.contentOffset = CGPoint(x: 0, y: (textView.contentSize.height - textView.frame.height) / 2)
        textView.textContainerInset = Constants.TextViewInsets.textInsets
        textView.font = UIFont.systemFont(ofSize: TextInputComponentView.Constants.TextView.fontSize)
        textView.adjustsFontForContentSizeCategory = true
        textView.delegate = self
        textView.backgroundColor = .clear
        return textView
    }()
    
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.TextView.placeHolder
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.TextView.sendButton), for: .normal)
        button.addTarget((Any).self, action: #selector(TextInputComponentView.didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let containerView: UIView = {
        let containerView = UIView()
        containerView.layer.borderWidth = Constants.Button.borderWidth
        containerView.layer.borderColor = Constants.ContainerView.containerViewBorderColor
        containerView.layer.cornerRadius = Constants.Button.cornerRadius
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    private var isDark = false
    
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
        setUpLayoutConstraints()
    }
    
    // MARK: Layout Constraints
    private func setUpLayoutConstraints() {
        setUpContainerView()
        setUpSendButton()
        setUpTextView()
        setUpPlaceHolderLabelConstraints()
    }
    
    private func setUpContainerView() {
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.ContainerView.side),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.ContainerView.side),
            containerView.heightAnchor.constraint(lessThanOrEqualToConstant: Constants.ContainerView.height)
        ])
    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        if let message = textView.text {
            delegate?.didTapButton(text: message)
            textView.text = ""
        }
    }
    
    private func setUpSendButton() {
        containerView.addSubview(sendButton)
        NSLayoutConstraint.activate([
            sendButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.Button.bottom),
            sendButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: Constants.Button.trailing),
            sendButton.heightAnchor.constraint(equalToConstant: Constants.Button.height),
            sendButton.widthAnchor.constraint(equalToConstant: Constants.Button.width)
        ])
    }
    
    private func setUpTextView() {
        containerView.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: containerView.topAnchor),
            textView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: Constants.TextView.side),
        ])
    }
    
    private func setUpPlaceHolderLabelConstraints() {
        containerView.addSubview(placeholderLabel)
        NSLayoutConstraint.activate([
                placeholderLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.textViewPlaceHolderLabelTop),
                placeholderLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.textViewPlaceHolderLabelBottom),
                placeholderLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.textViewPlaceHolderLabelLeading),
                placeholderLabel.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: Constants.textViewPlaceHolderLabelTrailing)
            ])
    }
    
    private func updateTextViewHeight() {
        let maxLines = textView.calculateMaxLines()
        if maxLines > Constants.TextView.maxLines {
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
    
    func setUpTextView(with color: UIColor) {
        textView.textColor = color
    }
}

// MARK: - UITextViewDelegate
extension TextInputComponentView: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholderLabel.text = ""
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeholderLabel.text = Constants.TextView.placeHolder
            placeholderLabel.textColor = .lightGray
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        updateTextViewHeight()
    }
}
