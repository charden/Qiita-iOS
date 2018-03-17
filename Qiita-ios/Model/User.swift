//
//  User.swift
//  Qiita-ios
//
//  Created by Takuya on 2018/03/17.
//  Copyright © 2018年 Takuya. All rights reserved.
//

import UIKit

struct User: Codable {
    let name: String
    let profileImageUrl: String
    private enum CodingKeys: String, CodingKey {
        case name
        case profileImageUrl = "profile_image_url"
    }
}
