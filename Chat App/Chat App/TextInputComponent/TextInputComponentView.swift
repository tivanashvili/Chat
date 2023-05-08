//
//  TextInputComponentViewModel.swift
//  Chat App
//
//  Created by tornike on 29.04.23.
//

import UIKit

final class TextInputComponentView: UIView{
    
    // MARK: Components
    private let containerView = UIView()
    
    private let textView = UITextView()
    
    private let button = UIButton()
    
    private var containerViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: init
    init() {
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
        containerView.layer.borderColor = Constants.ChatAppColors.containerViewBorderColor.cgColor
        containerView.layer.cornerRadius = 28
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setUpTextView() {
        textView.text = Constants.TextView.placeHolder
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isEditable = true
        textView.textColor = Constants.ChatAppColors.placeholderColor
        textView.delegate = self
        textView.contentOffset = CGPoint(x: 0, y: (textView.contentSize.height - textView.frame.height) / 2)
        textView.textContainerInset = UIEdgeInsets(top: 19, left: 22, bottom: 19, right: 0)
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.adjustsFontForContentSizeCategory = true
        containerView.addSubview(textView)
    }
    
    private func setUpButton() {
        button.setImage(UIImage(named:Constants.ImageNames.SendButton ), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(button)
    }
    
    // MARK: layout constraints
    private func setUpLayoutConstraints() {
        addSubview(containerView)
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: Constants.ContainerViewConstraints.height)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.ContainerViewConstraints.side),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.ContainerViewConstraints.side),
            containerViewHeightConstraint,
            
            textView.topAnchor.constraint(equalTo: containerView.topAnchor),
            textView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: Constants.TextViewConstraints.side),
            
            button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.ButtonConstraints.bottom),
            button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: Constants.ButtonConstraints.trailing),
            button.heightAnchor.constraint(equalToConstant: Constants.ButtonConstraints.height),
            button.widthAnchor.constraint(equalToConstant: Constants.ButtonConstraints.width),
        ])
    }
}
    
    extension TextInputComponentView: UITextViewDelegate{
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == Constants.ChatAppColors.placeholderColor{
                textView.text = ""
                textView.textColor = Constants.ChatAppColors.lightModeTextColor
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = Constants.TextView.placeHolder
                textView.textColor = Constants.ChatAppColors.placeholderColor
            }
        }
        
        func textViewDidChange(_ textView: UITextView) {
            guard let font = textView.font else { return }
            
            let maxHeight: CGFloat = 114.0
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
                containerViewHeightConstraint.constant = newHeight
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


