//
//  CommentListCellView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/10.
//

import SwiftUI
import MarkdownUI

struct CommentListCellView: View {
  
  let reply: ReplyModel?
  
  let index: Int?
  
  @Binding var showPersonalView: Bool
  
  var body: some View {
    if let reply = reply {
      VStack(alignment: .leading) {
        HStack {
          if let author = reply.author {
            AvatarView(avatarUrl: author.avatarUrl,
                       width: 24,
                       height: 24,
                       radius: 3)
            UserNameView(
              userName: author.loginname ?? "",
              showPersonalView: $showPersonalView
            )
          }
          Text(String(format: "%d楼·%@",
                      index ?? 0,
                      DateTime.date2BeforeTime(time: reply.createAt ?? "")))
          
          Spacer()
          
          if let upCnt = reply.ups?.count {
            if upCnt > 0 {
              HStack(spacing: 0) {
                Button(action: {
                  print("click up")
                }, label: {
                  Image(systemName: "hand.thumbsup")
                })
                .buttonStyle(StaticButtonStyle())
                Text(String(reply.ups?.count ?? 0))
              }
            }
          }
        }
        Markdown(reply.content ?? "",
                 baseURL: URL(string: "https:"))
        .font(.body)
        .fixedSize(horizontal: false, vertical: true)
      }
    }
  }
}

struct CommentListCellView_Previews: PreviewProvider {
  static var previews: some View {
    CommentListCellView(
      reply: PreviewData.getReplies()[0],
      index: 10,
      showPersonalView: .constant(false)
    )
  }
}
