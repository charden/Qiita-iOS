//
//  ItemViewCell.swift
//  Qiita-ios
//
//  Created by Takuya Ogawa on 2018/04/24.
//  Copyright © 2018年 Takuya. All rights reserved.
//

import UIKit

class ItemViewCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
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
