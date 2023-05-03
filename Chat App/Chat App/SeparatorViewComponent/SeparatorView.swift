//
//  SeparatorView.swift
//  ChatAppV2
//
//  Created by tornike on 26.04.23.
//

import UIKit

final class SeparatorView: UIView {
    
    // MARK: - variables
    
    private let separatorView = UIView()
    private let viewHeight: CGFloat = 6.0
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        setUpSeparatorView()
        setUpLayoutConstraints()
    }
    
    private func setUpSeparatorView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.backgroundColor = UIColor(hex: "F7CE7F").cgColor
    }
    
    private func setUpLayoutConstraints(){
        addSubview(separatorView)
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: topAnchor),
            self.leadingAnchor.constraint(equalTo: leadingAnchor),
            self.trailingAnchor.constraint(equalTo: trailingAnchor),
            self.heightAnchor.constraint(equalToConstant: viewHeight)
        ])
    }
    
}


