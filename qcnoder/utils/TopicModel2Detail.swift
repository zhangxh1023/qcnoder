//
//  TopicModel2Detail.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/7.
//

import Foundation

public struct TopicModel2Detail {
  
  public static func convert(topic: TopicModel) -> TopicDetailModel {
    var detail = TopicDetailModel()
    detail.id = topic.id
    detail.authorId = topic.authorId
    detail.tab = topic.tab
    detail.content = topic.content
    detail.title = topic.title
    detail.lastReplyAt = topic.lastReplyAt
    detail.good = topic.good
    detail.top = topic.top
    detail.replyCount = topic.replyCount
    detail.visitCount = topic.visitCount
    detail.createAt = topic.createAt
    detail.author = topic.author
    return detail
  }
  
}
