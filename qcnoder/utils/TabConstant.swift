//
//  TabConstant.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/10.
//

import Foundation

public struct TabConstant {
  
  public static let mp = [
    "ask": "问答",
    "share": "分享",
    "job": "招聘",
    "good": "精华",
    "dev": "客户端测试"
  ]
  
  public static func getText(tab: String) -> String {
    return mp[tab] ?? ""
  }
}
