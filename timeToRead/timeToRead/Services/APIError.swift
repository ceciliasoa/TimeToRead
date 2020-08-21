//
//  APIError.swift
//  timeToRead
//
//  Created by Cecilia Soares on 20/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case invalidUrl
    case couldNotDecode
    case failedRequest
    case unknowEroor (statuscode: Int)
}
