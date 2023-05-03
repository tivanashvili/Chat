//
//  TextInputComponentViewModel.swift
//  Chat App
//
//  Created by tornike on 29.04.23.
//

import UIKit

final class TextInputComponentView: UIView, UITextViewDelegate {
    
    // MARK: variables
    private let containerView = UIView()
    
    private let textView = UITextView()
    
    private var textInputComponentModel: TextInputComponentViewModel
    
    private let button = UIButton()
    
    private var containerViewHeightConstraint: NSLayoutConstraint!
    
    private let messageTableView = MessageTableView()
    
    // MARK: init
    init(frame: CGRect, textInputComponentModel: TextInputComponentViewModel) {
        self.textInputComponentModel = textInputComponentModel
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setup
    private func setUp() {
        setUpContainerView()
        setUpTextView()
        setUpButton()
        setUpLayoutConstraints()
    }
    
    private func setUpContainerView() {
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor(hex: "9F60FF").cgColor
        containerView.layer.cornerRadius = 28
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setUpTextView() {
        textView.text = textInputComponentModel.placeHolder
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isEditable = true
        textView.textColor = UIColor(hex: "C7C7C7")
        textView.delegate = self
        textView.contentOffset = CGPoint(x: 0, y: (textView.contentSize.height - textView.frame.height) / 2)
        textView.textContainerInset = UIEdgeInsets(top: 19, left: 22, bottom: 19, right: 0)
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.adjustsFontForContentSizeCategory = true
        containerView.addSubview(textView)
    }
    
    private func setUpButton() {
        button.setImage(UIImage(named: textInputComponentModel.sendButtonImageName), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(button)
    }
    
    // MARK: layout constraints
    private func setUpLayoutConstraints() {
        addSubview(containerView)
       containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: 56)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            textView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            textView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            textView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            textView.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -5),
            
            button.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
            button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            button.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 32),
            button.widthAnchor.constraint(equalToConstant: 32),
            containerViewHeightConstraint
        ])
    }

    // MARK: delegates
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor(hex: "C7C7C7") {
            textView.text = nil
            textView.textColor = UIColor(hex: "191919")
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = textInputComponentModel.placeHolder
            textView.textColor = UIColor(hex: "C7C7C7")
        }
    }

    func textViewDidChange(_ textView: UITextView) {
        print("Text view did change")
        guard let font = textView.font else { return }

        let maxHeight: CGFloat = 114
        let minHeight: CGFloat = 56
        let maxNumberOfLines = 5
        let numberOfLinesInText = textView.calculateLineCount()

        let size = CGSize(width: textView.frame.width - 24, height: textView.contentSize.height)
        let estimatedSize = textView.sizeThatFits(size)
        let numLines = Int(ceil(textView.contentSize.height / font.lineHeight))
        let newHeight = max(minHeight, min(estimatedSize.height, CGFloat(numLines) * font.lineHeight, maxHeight))

        if numberOfLinesInText > maxNumberOfLines {
            textView.isScrollEnabled = true
            containerViewHeightConstraint.constant = maxHeight
        } else {
            textView.isScrollEnabled = false
            containerViewHeightConstraint.constant = newHeight + 24
        }

        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = newHeight
            }
        }
        
        containerView.layoutIfNeeded()
    }
    
    
}

extension UITextView {
    func calculateLineCount() -> Int {
        let textLayoutManager = self.layoutManager
        let glyphCount = textLayoutManager.numberOfGlyphs
        var lineRange: NSRange = NSRange(location: 0, length: 1)
        var currentIndex = 0
        var numberOfLines = 0

        while currentIndex < glyphCount {
            textLayoutManager.lineFragmentRect(forGlyphAt: currentIndex, effectiveRange: &lineRange)
            currentIndex = NSMaxRange(lineRange)
            numberOfLines += 1
        }

        return numberOfLines
    }
}


