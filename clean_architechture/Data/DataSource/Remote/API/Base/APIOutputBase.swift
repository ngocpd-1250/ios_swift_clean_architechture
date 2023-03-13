//
//  APIOutputBase.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/07.
//

import ObjectMapper

open class APIOutputBase: Mappable {
    
    public init() {
        
    }
    
    public required init?(map: Map) {

    }
    
    open func mapping(map: Map) {
        
    }
}
