//
//  TopicListCellView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/3.
//

import SwiftUI

struct TopicListCellView: View {
  
  let topic: TopicModel
  
  var body: some View {
    HStack {
      AvatarView(avatarUrl: topic.author?.avatarUrl)
      Text(topic.title ?? "")
    }
    
  }
  
}

struct TopicListCellView_Previews: PreviewProvider {
  static var previews: some View {
    let previewData = PreviewData()
    TopicListCellView(topic: previewData.getTopic())
  }
}
