//
//  ButtonTableCellView.swift
//  NSTableViewSample
//
//  Created by 村田真矢 on 2017/09/10.
//  Copyright © 2017年 村田真矢. All rights reserved.
//

import Cocoa

protocol ButtonTableCellViewDelegte: class {
    func didButtonAction(sender: NSButton)
}

class ButtonTableCellView: NSTableCellView {
    
    weak var buttonTableCellViewDelegte: ButtonTableCellViewDelegte?

    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadXib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.loadXib()
    }
    
    // MARK: - Private Method
    private func loadXib() {
        var topLevelObjects = NSArray()
        let nibName: String = "ButtonTableCellView"
        if Bundle.main.loadNibNamed(nibName, owner: self, topLevelObjects: &topLevelObjects) {
            let filteredTopLevelObject = topLevelObjects.filter {$0 is NSView}
            guard let buttonTableCellView: NSView = filteredTopLevelObject.first as? NSView else {
                return
            }
            buttonTableCellView.frame = self.bounds
            self.addSubview(buttonTableCellView)
            guard let superView: NSView = buttonTableCellView.superview else {
                return
            }
            
            buttonTableCellView.translatesAutoresizingMaskIntoConstraints = false
            buttonTableCellView.topAnchor.constraint(equalTo: superView.topAnchor, constant: 0.0).isActive = true
            buttonTableCellView.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: 0.0).isActive = true
            buttonTableCellView.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 0.0).isActive = true
            buttonTableCellView.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: 0.0).isActive = true
        }
    }

    
    @IBAction func buttonAction(_ sender: NSButton) {
        self.buttonTableCellViewDelegte?.didButtonAction(sender: sender)
    }
}
