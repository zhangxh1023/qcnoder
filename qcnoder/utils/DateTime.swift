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
    //2022-09-27T12:49:19.941Z
    let beforeTime = dateFormatter.date(from: time)
    let calendar = Calendar.current
    let now = Date()
    let diff = calendar.dateComponents([.day], from: beforeTime!, to: now)
    return String(diff.day!) + "天前"
  }
  
}
