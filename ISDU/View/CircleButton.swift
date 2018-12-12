//
//  CircleButton.swift
//  iSDU
//
//  Created by 高天宇 on 2018/11/23.
//  Copyright © 2018 学生在线. All rights reserved.
//

import UIKit

class CircleButton: UIButton {

    
//     Only override draw() if you perform custom drawing.
//     An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
         self.layer.cornerRadius = self.frame.size.width/2
        
//         self.layer.masksToBounds = true
    }
    

}
