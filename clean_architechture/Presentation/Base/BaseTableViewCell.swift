//
//  BaseTableViewCell.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

import Foundation
import Reusable

// swiftlint:disable:next final_class
class BaseTableViewCell: UITableViewCell, NibReusable {
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
