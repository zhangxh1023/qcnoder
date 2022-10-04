//
//  TopicListCellView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/3.
//

import SwiftUI

let topicTarget = TopicTarget()

struct TopicListCellView: View {
  
  let topic: TopicModel
  
  var body: some View {
    HStack {
      AvatarView(avatarUrl: topic.author?.avatarUrl)
      HStack {
        Text(String(topic.replyCount ?? 0))
          .font(
            .system(size: 14)
          )
          .foregroundColor(.purple)
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -7))
        Text("/" + String(topic.visitCount ?? 0))
          .font(
            .system(size: 10)
          )
          .foregroundColor(.gray)
      }
      .frame(minWidth: 60)
      ZStack {
        Text(topicTarget.getText(topic: topic))
          .font(.system(size: 12))
          .foregroundColor(.white)
      }
      .frame(width: 30, height: 18)
      .background(topicTarget.getColor(topic: topic))
      .mask(RoundedRectangle(cornerRadius: 3))
      Text(topic.title ?? "")
    }
    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
    
  }
  
}

struct TopicListCellView_Previews: PreviewProvider {
  static var previews: some View {
    let previewData = PreviewData()
    TopicListCellView(topic: previewData.getTopic())
  }
}
