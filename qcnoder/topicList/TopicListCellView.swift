//
//  TopicListCellView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/3.
//

import SwiftUI

extension View {
    func expandable () -> some View {
        ZStack {
            Color.clear
            self
        }
        .frame(width: 30, height: 18)
    }
}

struct TopicListCellView: View {
  
  let topic: TopicModel
  
  var body: some View {
    HStack {
      AvatarView(avatarUrl: topic.author?.avatarUrl)
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
      Text("精华")
        .font(.system(size: 12))
        .foregroundColor(.white)
        .expandable()
        .background(Color.green)
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
