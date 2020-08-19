//
//  FinalPageModel.swift
//  timeToRead
//
//  Created by Cecilia Soares on 19/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import Foundation

class FinalPageModel{
    var finalPage: String?
    var initialPage: String?
    var totalPage: String?
    
    init(finalPage: String?, initialPage: String?, totalPage: String?) {
        self.finalPage = finalPage
        self.totalPage = totalPage
        self.initialPage = initialPage
    }

    func result(){
        guard  let finalPage = finalPage else {return}
        guard let initialPage = initialPage else {return}
        guard let totalPage = totalPage else {return}
        let final = Int(finalPage) ?? 0
        let inicial = Int(initialPage) ?? 0
        let total = Int(totalPage) ?? 0
        let readPage = final - inicial
        let resultPages = final * 100 / total
        let result = [readPage, resultPages]
        print(result)
        
    }
}


