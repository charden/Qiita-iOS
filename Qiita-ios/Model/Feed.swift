//
//  Feed.swift
//  Qiita-ios
//
//  Created by Takuya Ogawa on 2018/04/25.
//  Copyright © 2018年 Takuya. All rights reserved.
//

import UIKit

struct Feed {
    let cellType: CellType
    let ad: Ad?
    let item: Item?
    let position: Int
}
enum CellType {
    case AD
    case ITEM
}
