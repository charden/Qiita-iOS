//
//  ItemViewModel.swift
//  Qiita-ios
//
//  Created by Takuya Ogawa on 2018/04/20.
//  Copyright © 2018年 Takuya. All rights reserved.
//

import UIKit
import RxSwift

class ItemViewModel: NSObject {
    let items: Variable<[Item]> = Variable<[Item]>([])
}
