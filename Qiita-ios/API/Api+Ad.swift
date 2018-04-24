//
//  Api+Ad.swift
//  Qiita-ios
//
//  Created by Takuya Ogawa on 2018/04/24.
//  Copyright © 2018年 Takuya. All rights reserved.
//

import UIKit
import Moya

extension Qiita {
    struct GetAd: QiitaTargetType {
        typealias Response = [Ad]
        var path: String {
            return "/ad"
        }

        var method: Moya.Method {
            return .get
        }

        var task: Task {
            return .requestPlain
        }
        var sampleData: Data {
            return FileHandle(forReadingAtPath: R.file.sampleJson.path()!)!.readDataToEndOfFile()
        }
    }
}
