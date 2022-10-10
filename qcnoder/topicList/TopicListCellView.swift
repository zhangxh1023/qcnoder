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
      AvatarView(
        avatarUrl: topic.author?.avatarUrl,
        width: 48,
        height: 48,
        radius: 6
      )
      
      VStack (alignment: .leading) {
        HStack {
          ZStack {
            Text(TopicTarget.getText(topic: topic))
              .font(.system(size: 12))
              .foregroundColor(.white)
          }
          .frame(width: 30, height: 18)
          .background(TopicTarget.getColor(topic: topic))
          .mask(RoundedRectangle(cornerRadius: 3))
          
          Text(topic.title ?? "")
        }
        
        HStack(spacing: 0) {
          UserNameView(userName: topic.author?.loginname ?? "")
          Text(String(
            format: "·%@",
            DateTime.date2BeforeTime(time: topic.createAt ?? "")
          ))
          
          Text(String(
            format: "最新回复·%@",
            DateTime.date2BeforeTime(time: topic.lastReplyAt ?? "")
          ))
          .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
        }
        .font(.system(size: 12))
        .foregroundColor(.gray)
      }
      
      
      Spacer()
      VStack {
        Text(String(topic.replyCount ?? 0))
          .font(
            .system(size: 12)
          )
          .foregroundColor(.purple)
        
        Text(String(topic.visitCount ?? 0))
          .font(
            .system(size: 12)
          )
          .foregroundColor(.gray)
      }
    }
    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
  }
  
}

struct TopicListCellView_Previews: PreviewProvider {
  static var previews: some View {
    TopicListCellView(topic: PreviewData.getTopic())
  }
}
