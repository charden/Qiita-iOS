//
//  Item.swift
//  Qiita-ios
//
//  Created by Takuya on 2018/03/17.
//  Copyright © 2018年 Takuya. All rights reserved.
//

import UIKit

struct Item: Codable {
    let id: String
    let title: String
    let url: String
    let user: User
}
