//
//  UITextView+Extensions.swift
//  Chat App
//
//  Created by tornike on 18.05.23.
//

import Foundation
import UIKit

extension UITextView {
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: self.frame.width, height: CGFloat(Float.infinity))
        let font = self.font ?? .systemFont(ofSize: TextInputComponentView.Constants.TextView.fontSize)
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height / charSize))
        return linesRoundedUp
    }
}
