//
//  Utils.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

import Foundation

func infoForKey(_ key: String) -> String {
    return (Bundle.main.infoDictionary?[key] as? String)?
        .replacingOccurrences(of: "\\", with: "") ?? ""
}
