//
//  SeparatorView.swift
//  ChatAppV2
//
//  Created by tornike on 26.04.23.
//

import UIKit

class SeparatorView: UIView {
    
    // MARK: - variables
    
    private let separatorView = UIView()
    private let viewHeight: CGFloat = 6.0
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    private func setUp(){
        setUpSeparatorView()
        setUpLayoutConstraints()
    }
    
    private func setUpSeparatorView() {
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = UIColor(red: 0.97, green: 0.81, blue: 0.50, alpha: 1.0)
    }
    
    private func setUpLayoutConstraints(){
        addSubview(separatorView)
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: topAnchor),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: viewHeight)
        ])
    }
    
}


