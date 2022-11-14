//
//  CommentListCellView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/10.
//

import SwiftUI
import MarkdownUI

struct CommentListCellView: View {
  
  let topicAuthorName: String?
  
  let reply: ReplyModel?
  
  let index: Int?
  
  let topicId: String?
  
  @State var replyContent = ""
  
  @State var isHover: Bool = false
  
  @State var showContentEditor = false
  
  @State var isReplying = false
  
  @EnvironmentObject var globalState: GlobalState
  
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
          
          if let topicAuthorName = topicAuthorName,
             topicAuthorName == reply.author?.loginname ?? "" {
            ZStack {
              Text("作者")
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
            }
            .background(.blue)
            .mask(RoundedRectangle(cornerRadius: 2))
            
          }
          
          Spacer()
          
          if globalState.accesstoken != nil {
            UpsView(replyView: ReplyViewModel(reply: reply), isHover: $isHover)
            Button(action: {
              print("show reply content")
              showContentEditor = !showContentEditor
            }, label: {
              Image(systemName: showContentEditor
                    ? "arrowshape.turn.up.left.fill"
                    : "arrowshape.turn.up.left")
            })
            .buttonStyle(BorderlessButtonStyle())
          }
        }
        Markdown(reply.content ?? "",
                 baseURL: URL(string: "https:"))
        .font(.body)
        .fixedSize(horizontal: false, vertical: true)
        
        if showContentEditor {
          ContentEditor(content: $replyContent)
          Button(action: {
            if !isReplying {
              print("click reply btn")
              createReply()
            }
          }, label: {
            Text("回复")
              .frame(width: 50, height: 30)
              .foregroundColor(isReplying ? .black : .white)
              .background(isReplying ? .gray : .blue)
              .mask(RoundedRectangle(cornerRadius: 3))
          })
          .buttonStyle(BorderlessButtonStyle())
        }
      }
      .onHover { hover in
        self.isHover = hover
      }
      .task {
        replyContent = "@\(reply.author?.loginname ?? "") "
      }
    }
  }
  
  func createReply() {
    isReplying = true
    Task {
      if let topicId = topicId {
        do {
          let data = try await api.createReply(topicId: topicId, content: replyContent, replyId: reply?.id ?? nil)
          if let success = data?.success, success {
            replyContent = "@\(reply?.author?.loginname ?? "") "
            showContentEditor = false
          }
        } catch {
          
        }
      }
      isReplying = false
    }
  }
  
}

struct CommentListCellView_Previews: PreviewProvider {
  static var previews: some View {
    CommentListCellView(
      topicAuthorName: "zhangxh1023",
      reply: PreviewData.getReplies()[0],
      index: 10,
      topicId: nil
    )
  }
}
