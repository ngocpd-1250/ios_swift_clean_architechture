//
//  String+Base64.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/07.
//

import Foundation

extension String {
    /// Encode a String to Base64
    func toBase64() -> String {
        return Data(utf8).base64EncodedString()
    }

    /// Decode a String from Base64. Returns nil if unsuccessful.
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
}
