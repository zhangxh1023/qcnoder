//
//  DateTime.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/5.
//

import Foundation

public struct DateTime {
  
  public static func date2BeforeTime(time: String) -> String {
    if time.isEmpty {
      return ""
    }
    let dateFormatter = DateFormatter.init()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH.mm.ss.SSSVV"
    // 2022-09-27T12:49:19.941Z
    let beforeTime = dateFormatter.date(from: time)
    let calendar = Calendar.current
    let now = Date()
    let diff = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: beforeTime!, to: now)
    
    if let year = diff.year {
      if year > 0 {
        return "\(String(year))年前"
      }
    }
    if let month = diff.month {
      if month > 0 {
        return "\(String(month))个月前"
      }
    }
    if let day = diff.day {
      if day > 0 {
        return "\(String(day))天前"
      }
    }
    if let hour = diff.hour {
      if hour > 0 {
        return "\(String(hour))小时前"
      }
    }
    if let minute = diff.minute {
      if minute > 0 {
        return "\(String(minute))小时前"
      }
    }
    
    return "\(String(diff.second ?? 0))秒前"
  }
  
}
