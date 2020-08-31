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
    var bookTitle: String?
    var bookAuthor: String?
    var timerDuration: Double?
    
    
    
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
    func convertFinalPage() -> Int {
        guard  let finalPage = finalPage else {fatalError("error")}
        return finalPage
    }
    
    func convertTotalPage() -> Int {
        guard let totalPage = totalPage else {fatalError("error")}
        return totalPage
    }
    func read30Page() -> Int{
        
        guard  let finalPage = finalPage else {fatalError("error")}
        guard let totalPage = totalPage else {fatalError("error")}
        let days = (totalPage - finalPage) / 30
        if ((totalPage - finalPage) % 30 == 0){
            return days
        } else{
            return days + 1
        }
    }
    
    //    func getDuration() -> Double {
    //        guard let duration = timerDuration else {fatalError("error")}
    //        return duration
    //
    //    }
    func convertDuration() -> String{
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional // Use the appropriate positioning for the current locale
        formatter.allowedUnits = [.minute, .second ] // Units to display in the formatted string
        formatter.zeroFormattingBehavior = [ .pad ] // Pad with zeroes where appropriate for the locale
        let formattedDuration = formatter.string(from: timerDuration ?? 0.0)
        
        guard let formatted = formattedDuration else {fatalError("error")}
        return formatted
    }
    func durationBook() -> String {
        let readed = Double(readedPage())
        guard let duration = timerDuration else {fatalError("error")}
        guard let totalPage = totalPage else {fatalError("error")}
//        let hourTime = Int((duration.truncatingRemainder(dividingBy: 86400)) / 360)
        let minuteTime = duration / 60
        let rounded = round(minuteTime * 100) / 100
        let time = readed / rounded
//        print(time)
        let totalTime = (Double(totalPage) / time) * 60
//        print(totalTime)
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full // Use the appropriate positioning for the current locale
        formatter.allowedUnits = [ .hour, .minute ] // Units to display in the formatted string
//        formatter.zeroFormattingBehavior = [ .pad ] // Pad with zeroes where appropriate for the locale
        let formattedDuration = formatter.string(from: totalTime)
//        print(formattedDuration)
        guard let formatted = formattedDuration else {fatalError("error")}
        return formatted
        
    }
    
}
//
//class Duration {
//    var timerDuration: Double?
//    
//    static var shared = Duration()
//    
//    func getDuration() -> Double {
//        guard let duration = timerDuration else {fatalError("error")}
//        return duration
//        
//    }
//    func convertDuration() -> String{
//        let formatter = DateComponentsFormatter()
//        formatter.unitsStyle = .positional // Use the appropriate positioning for the current locale
//        formatter.allowedUnits = [.minute, .second ] // Units to display in the formatted string
//        formatter.zeroFormattingBehavior = [ .pad ] // Pad with zeroes where appropriate for the locale
//        let formattedDuration = formatter.string(from: timerDuration ?? 0.0)
//        
//        guard let formatted = formattedDuration else {fatalError("error")}
//        return formatted
//    }
//}


