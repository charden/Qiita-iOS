//
//  ItemTableViewController.swift
//  Qiita-ios
//
//  Created by Takuya on 2018/03/17.
//  Copyright © 2018年 Takuya. All rights reserved.
//

import UIKit
import SafariServices
import Kingfisher
import RxSwift
import NSObject_Rx
import RxCocoa

class ItemTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let viewModel = ItemViewModel()
        viewModel.items.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "reuseIdentifier")) { (_, item, cell) in
                cell.textLabel?.text = item.title
                let imageUrl = URL(string: item.user.profileImageUrl)!
                cell.imageView?.kf.setImage(with: imageUrl, completionHandler: { (_, _, _, _) in
                    cell.layoutSubviews()
                })
            }
            .disposed(by: rx.disposeBag)
        tableView.rx.modelSelected(Item.self)
            .subscribe(onNext: { [weak self] item in
                let safari = SFSafariViewController(url: URL(string: item.url)!)
                safari.title = item.title
                self?.present(safari, animated: true, completion: nil)
            }).disposed(by: rx.disposeBag)
        Api.shared.request(Qiita.GetItem())
            .subscribe(
                onSuccess: { items in
                    viewModel.items.value = items
                },
                onError: { error in print("error: \(error)")}
            ).disposed(by: rx.disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
