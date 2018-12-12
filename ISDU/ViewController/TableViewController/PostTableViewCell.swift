//
//  PostTableViewCell.swift
//  iSDU
//
//  Created by 高天宇 on 2018/11/23.
//  Copyright © 2018 学生在线. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var circleImageView: CircleButton!
    @IBOutlet weak var flag_Label: UILabelPadding!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var releaseTime: UILabel!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var likeNumber: UILabel!
    @IBOutlet weak var commentNUmber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        flag_Label.layer.cornerRadius = 4
        flag_Label.layer.masksToBounds = true
//        if flag_Label.text == ""{
//            flag_Label.paddingLeft = 0
//            flag_Label.paddingRight = 0
//            flag_Label.paddingTop = 0
//            flag_Label.paddingBottom = 0
//        }
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
