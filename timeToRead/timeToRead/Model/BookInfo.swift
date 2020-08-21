//
//  BookInfo.swift
//  timeToRead
//
//  Created by Cecilia Soares on 21/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//
//
import Foundation

class Reading {
    
    var initialPage: Int?
    var finalPage: Int?
    var totalPage: Int?
    
    
    static var shared = Reading()
    
    func convertDouble() -> Double{
        guard let totalPage = totalPage else {fatalError("error")}
        let total = Double(totalPage)
        return total

    }
    func readedPage() -> Int {
        guard  let finalPage = finalPage else {fatalError("error")}
        guard let initialPage = initialPage else {fatalError("error")}

        let readPage = finalPage - initialPage
        return readPage

    }
    func totalRead() -> Double {
        guard  let finalPage = finalPage else {fatalError("error")}

        guard let totalPage = totalPage else {fatalError("error")}
       
        let resultPages = Double(finalPage * 100 / totalPage)
        return resultPages
    }
    
    
    
}

class Duration {
    var timerDuration: Double?
    
    static var shared = Duration()
    
    func getDuration() -> Double {
        guard let duration = timerDuration else {fatalError("error")}
        return duration
    }
}


//class Leitura {
//    
//    var paginaInicial: Int?
//    var paginaFinal: Int?
//    var totalDePaginas: Int?
//    
//    static var shared = Leitura()
//    
//    func calcular() -> Double {
//        
//    }
//    
//}
