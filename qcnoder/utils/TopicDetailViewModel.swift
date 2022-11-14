//
//  TopicDetailViewModel.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/11/14.
//

import Foundation

class TopicDetailViewModel: ObservableObject {
  @Published var topicDetail: TopicDetailModel
  
  init(topicDetail: TopicDetailModel) {
    self.topicDetail = topicDetail
  }
  
  public func toggleIsCollect() {
    topicDetail.toggleIsCollect()
  }
}

