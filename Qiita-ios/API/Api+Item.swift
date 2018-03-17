//
//  Api+Item.swift
//  Qiita-ios
//
//  Created by Takuya on 2018/03/17.
//  Copyright © 2018年 Takuya. All rights reserved.
//

import UIKit
import Moya

extension Qiita {
    struct GetItem: QiitaTargetType {
        typealias Response = [Item]
        var path: String {
            return "/items"
        }

        var method: Moya.Method {
            return .get
        }

        var task: Task {
            return .requestPlain
        }
    }
}
