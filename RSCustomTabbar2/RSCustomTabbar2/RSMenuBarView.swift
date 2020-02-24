//
//  RSMenuBarView.swift
//  RSCustomTabbar2
//
//  Created by rose on 24/02/2020.
//  Copyright © 2020 rose. All rights reserved.
//

import Foundation
import UIKit

class MenuBar:UIView {
    var items:[Any] = []
    var delegate:MenuBarDelegate?
    var buttonWidth:CGFloat = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawMenu() {
        buttonWidth = self.frame.width/CGFloat(self.items.count)
        
        self.backgroundColor = UIColor.white
        self.alpha = 0.9
        self.layer.cornerRadius = 15
        
        for (index, menuItem) in items.enumerated() {
            let button:UIButton = UIButton.init(frame: CGRect(x: (buttonWidth * CGFloat(index)), y: 0, width: buttonWidth, height: self.frame.height))
            button.tag = index + 10
            button.setTitle(menuItem as! String, for: .normal)
            if index == 0 {
                button.setTitleColor(UIColor.black, for: .normal)
            } else {
                button.setTitleColor(UIColor.darkGray, for: .normal)
            }
            
            button.addTarget(self, action: #selector(self.touchMenuButton(_:)), for: UIControl.Event.touchUpInside)
            self.addSubview(button)
        }
    }
    
    @objc func touchMenuButton( _ button : UIButton) {
        
        items.indices.forEach {
            let tmpButton = self.viewWithTag($0 + 10) as? UIButton
            if button.tag == $0 + 10 {
                tmpButton?.setTitleColor(UIColor.black, for: .normal)
            } else {
                tmpButton?.setTitleColor(UIColor.darkGray, for: .normal)
            }
        }
        let itemAt = button.tag - 10
        let indexPath = IndexPath(item: itemAt, section: 0)
        delegate?.changeView(index: indexPath)
    }
    
    func moveToPage(scrollTo index:IndexPath) {
        let currentButton:UIButton = self.viewWithTag(index.row + 10) as! UIButton
        items.indices.forEach {
            let tmpButton = self.viewWithTag($0 + 10) as? UIButton
            if currentButton.tag == $0 + 10 {
                tmpButton?.setTitleColor(UIColor.black, for: .normal)
            } else {
                tmpButton?.setTitleColor(UIColor.darkGray, for: .normal)
            }
        }
    }
}

protocol MenuBarDelegate {
    func changeView(index:IndexPath)
}
