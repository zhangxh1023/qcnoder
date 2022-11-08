//
//  ReplyViewModel.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/11/8.
//

import Foundation

class ReplyViewModel: ObservableObject {
  
  @Published var reply: ReplyModel
  
  init(reply: ReplyModel) {
    self.reply = reply
  }
  
  public func toggleIsUped(id: String) {
    reply.toggleIsUped(id: id)
  }
}
