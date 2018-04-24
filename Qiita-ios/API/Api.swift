//
//  Api.swift
//  Qiita-ios
//
//  Created by Takuya on 2018/03/17.
//  Copyright © 2018年 Takuya. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import RxMoya

extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

protocol QiitaTargetType: TargetType {
    associatedtype Response: Codable

}

extension QiitaTargetType {

    var baseURL: URL {
        return URL(string: "https://qiita.com/api/v2")!
    }
    var headers: [String: String]? {
        return nil
    }
}

enum Qiita {

}

class Api {
    static let shared = Api()
    private let provider = MoyaProvider<MultiTarget>(stubClosure: MoyaProvider.delayedStub(2))

    func request<R>(_ request: R) -> Single<R.Response> where R: QiitaTargetType {
        let target = MultiTarget(request)
        return provider.rx.request(target)
            .filterSuccessfulStatusCodes()
            .map(R.Response.self)
    }
}
