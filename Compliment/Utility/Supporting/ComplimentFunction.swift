//
//  ComplimentFunction.swift
//  Compliment
//
//  Created by jeonminseop on 2019/04/07.
//  Copyright © 2019 jeonminseop. All rights reserved.
//

import UIKit

class ComplimentFunction: NSObject {
  
  static let shared = ComplimentFunction()

  func getToday(format:String = "yyyy/MM/dd") -> String {
    let now = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = format
    return formatter.string(from: now as Date)
  }
  
  func getStringDate(date: Date, format:String = "yyyy/MM/dd") -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    return formatter.string(from: date as Date)
  }
  
  func dateFromString(string: String, format: String = "yyyy/MM/dd") -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    if let date = formatter.date(from: string) {
      return date
    } else {
      return Date()
    }
  }
}
