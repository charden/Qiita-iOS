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
        tableView.register(R.nib.itemViewCell)
        tableView.register(R.nib.adCell)
        tableView.rowHeight = 64
        tableView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        let viewModel = ItemViewModel()
        viewModel.feed.asObservable()
            .bind(to: tableView.rx.items) { (tableView, row, feed) in
                print(row)
                if feed.cellType == .AD {
                    let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.ad.identifier) as? AdCell
                    return cell!
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.cell.identifier) as? ItemViewCell
                    cell?.title.text = feed.item?.title
                    let imageUrl = URL(string: (feed.item?.user.profileImageUrl)!)!
                    cell?.thumbnail.kf.setImage(with: imageUrl)
                    return cell!
                }

            }
            .disposed(by: rx.disposeBag)
        tableView.rx.modelSelected(Feed.self)
            .subscribe(onNext: { [weak self] feed in
                let safari = SFSafariViewController(url: URL(string: (feed.item?.url)!)!)
                safari.title = feed.item?.title
                self?.navigationController?.pushViewController(safari, animated: true)
            }).disposed(by: rx.disposeBag)

        viewModel.request()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ItemTableViewController {

}
