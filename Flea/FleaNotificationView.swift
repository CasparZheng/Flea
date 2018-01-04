//
//  FleaNotificationView.swift
//  FleaSample
//
//  Created by 廖雷 on 16/8/1.
//  Copyright © 2016年 廖雷. All rights reserved.
//

import UIKit

class FleaNotificationView: UIView {

    weak var flea: Flea?
    var widthScale: CGFloat = 1.0
    var heightScale: CGFloat = 1.0
    var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    var actionItem: FleaActionItem? {
        didSet {
            actionButton.setTitle(actionItem?.title, for: UIControlState())
            actionButton.setTitleColor(actionItem?.color, for: UIControlState())
        }
    }

    var titleLabel = { () -> UILabel in
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 2
        return label
    }()
    var closeButton = { () -> UIButton in
        let button = UIButton(type: .system)
        
        let icon = UIImage(named: "flea-close", in: Bundle(for: FleaNotificationView.self), compatibleWith: nil)
        button.tintColor = UIColor.white
        button.setImage(icon, for: UIControlState())
        
        return button
    }()
    var actionButton = { () -> UIButton in
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }()
    
    @objc fileprivate func onClose(_ sender: UIButton) {
        flea?.dismiss()
    }
}

extension FleaNotificationView: FleaContentView {
    func willBeAdded(to flea: Flea) {
        addSubview(closeButton)
        addSubview(titleLabel)
        addSubview(actionButton)

        closeButton.addTarget(self, action: #selector(onClose(_:)), for: .touchUpInside)
        
        let size = CGSize(width: flea.bounds.width * widthScale, height: 44)
        
        closeButton.frame = CGRect(x: 10, y: 0, width: size.height, height: size.height)
        
//        titleLabel.sizeToFit()
        titleLabel.frame = CGRect(x: closeButton.frame.maxX + 5, y: 0, width: size.width - 2 * (closeButton.frame.maxX + 5), height: size.height)
        
        actionButton.sizeToFit()
        print(actionButton.frame)
        actionButton.frame = CGRect(x: size.width - actionButton.frame.width - 20, y: 0, width: actionButton.frame.width, height: size.height)
        
        actionButton.addTarget(self, action: #selector(onTapButton(_:)), for: .touchUpInside)

        frame = CGRect(origin: CGPoint(), size: size)
    }
    
    @objc fileprivate func onTapButton(_ sender: UIButton) {
        self.actionItem?.action?()
        flea?.dismiss()
    }
    
}
