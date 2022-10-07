//
//  TopicTarget.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/4.
//

import Foundation
import SwiftUI

public struct TopicTarget {
  
  public static func getText(topic: TopicModel) -> String {
    if let isTop = topic.top {
      if isTop {
        return "置顶"
      }
    }
    if topic.tab == "ask" {
      return "问答"
    }
    
    if topic.tab == "share" {
      return "分享"
    }
    
    if topic.tab == "job" {
      return "招聘"
    }
    
    if topic.tab == "good" {
      return "精华"
    }
    
    return "测试"
  }
  
  public static func getColor(topic: TopicModel) -> Color {
    if topic.tab == "good" || topic.good ?? false || topic.top ?? false {
      return Color.green
    }
    return Color.gray
  }
  
}
