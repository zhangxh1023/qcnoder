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
  
  @State private var isHover: Bool = false
  
  var body: some View {
    if let reply = reply {
      VStack(alignment: .leading) {
        HStack {
          if let author = reply.author {
            AvatarView(avatarUrl: author.avatarUrl,
                       loginname: author.loginname,
                       width: 24,
                       height: 24,
                       radius: 3)
            UserNameView(
              userName: author.loginname ?? ""
            )
          }
          Text(String(format: "%d楼·%@",
                      index ?? 0,
                      DateTime.date2BeforeTime(time: reply.createAt ?? "")))
          
          Spacer()
          
          UpsView(replyView: ReplyViewModel(reply: reply), isHover: $isHover)
        }
        Markdown(reply.content ?? "",
                 baseURL: URL(string: "https:"))
        .font(.body)
        .fixedSize(horizontal: false, vertical: true)
      }
      .onHover { hover in
        self.isHover = hover
      }
    }
  }
  
}

struct CommentListCellView_Previews: PreviewProvider {
  static var previews: some View {
    CommentListCellView(
      reply: PreviewData.getReplies()[0],
      index: 10
    )
  }
}
