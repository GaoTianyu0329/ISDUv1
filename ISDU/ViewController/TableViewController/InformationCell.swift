//
//  InformationCellTableViewCell.swift
//  iSDU
//
//  Created by 学生在线 on 2018/7/20.
//  Copyright © 2018年 学生在线. All rights reserved.
//

import UIKit

class InformationCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
