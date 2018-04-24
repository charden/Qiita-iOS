//
//  ItemViewModel.swift
//  Qiita-ios
//
//  Created by Takuya Ogawa on 2018/04/20.
//  Copyright © 2018年 Takuya. All rights reserved.
//

import UIKit
import RxSwift
import Moya

class ItemViewModel: NSObject {
    var items: [Item] = []
    var ads: [Ad] = []
    var feed: Variable<[Feed]> = Variable<[Feed]>([])

    func merge() {
        var feeds: [Feed] = []
        _ = items.enumerated().map {index, item in
            if let ad = getAd(position: index) {
                let feed = Feed(cellType: .AD, ad: ad, item: nil, position: feeds.count)
                feeds.append(feed)
            }
            let feed = Feed(cellType: .ITEM, ad: nil, item: item, position: feeds.count)
            feeds.append(feed)
        }
        self.feed.value = feeds
    }

    func getAd(position: Int) -> Ad? {
        return ads.filter({$0.position == String(position)}).first
    }

    func request() {

        Api.shared.request(Qiita.GetItem())
            .subscribe(
                onSuccess: { items in
                    self.items = items
                    self.adRequest()
            },
                onError: { error in print("error: \(error)")}
            ).disposed(by: rx.disposeBag)

    }

    func adRequest() {
        return Api.shared.request(Qiita.GetAd())
            .subscribe(
                onSuccess: { ads in
                    self.ads = ads
                    self.merge()
            },
                onError: { error in print("error: \(error)")}
            ).disposed(by: rx.disposeBag)
    }
}
