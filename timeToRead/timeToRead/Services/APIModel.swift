//
//  APIModel.swift
//  timeToRead
//
//  Created by Cecilia Soares on 20/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import Foundation
/*
struct Book: Identifiable, Decodable, Hashable{
    var id: String
    
    struct items: Decodable, Identifiable, Hashable {
        var id: String
        var pageCount:[String:String]
    }
  
}
 */

struct Response: Decodable {
    var items: [Book]
}

struct Book: Decodable {
    var volumeInfo: VolumeInfo
}

struct VolumeInfo: Decodable {
    var pageCount: Int?
}
