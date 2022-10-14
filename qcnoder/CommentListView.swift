//
//  CommentListView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/10.
//

import SwiftUI

struct CommentListView: View {
  
  let topicDetail: TopicDetailModel?
  
  var body: some View {
    if let topicDetail = topicDetail {
      if let replies = topicDetail.replies {
        if replies.count > 0 {
          HStack {
            Text(String(format: "%d 回复", replies.count))
            Spacer()
          }
          .padding()
          .background(.gray)
          .mask(RoundedRectangle(cornerRadius: 3))
          
          ForEach(replies.indices, id: \.self) { index in
            if index > 0 {
              Divider()
            }
            CommentListCellView(
              reply: replies[index],
              index: index + 1
            )
              .padding()
          }
        }
      }
    }
  }
}

struct CommentListView_Previews: PreviewProvider {
  static var previews: some View {
    CommentListView(
      topicDetail: PreviewData.getTopicDetail()
    )
  }
}
