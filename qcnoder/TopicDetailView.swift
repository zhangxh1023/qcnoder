//
//  TopicDetailView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/7.
//

import SwiftUI
import MarkdownUI

let accesstoken = ""

struct TopicDetailView: View {
  
  @EnvironmentObject private var globalState: GlobalState
  
  @State var topicDetail: TopicDetailModel?
  
  @State var replyContent = ""
  
  @State var isReplying = false
  
  var body: some View {
    if let topicDetail = topicDetail {
      List {
        VStack(alignment: .leading, spacing: 0) {
          Text(topicDetail.title ?? "")
            .font(.title)
          
          HStack(spacing: 0) {
            Text(String(format: "发布于%@ · 作者 ",
                        DateTime.date2BeforeTime(time: topicDetail.createAt ?? ""))
            )
            .font(.system(size: 12))
            .foregroundColor(.gray)
            UserNameView(
              userName: topicDetail.author?.loginname ?? ""
            )
            Text(String(format: " · %d次浏览 · 来自 %@",
                        topicDetail.visitCount ?? 0,
                        TabConstant.getText(tab: topicDetail.tab ?? ""))
            )
            .font(.system(size: 12))
            .foregroundColor(.gray)
            Spacer()
            CollectBtnView(topicDetailView: TopicDetailViewModel(topicDetail: topicDetail))
          }
          .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
          
          Divider()
          if let content = topicDetail.content {
            // ![yuque_diagram.jpg](//static.cnodejs.org/FlRpbwKzQWfj6vKKPI7vRILJ7aqk)
            Markdown(content,
                     baseURL: URL(string: "https:"))
            .font(.body)
            .fixedSize(horizontal: false, vertical: true)
            .padding()
          }
          
          CommentListView(
            topicDetail: topicDetail
          )
          
          if globalState.accesstoken != nil {
            Divider()
            HStack {
              Text("添加回复")
              Spacer()
            }
            .padding()
            .mask(RoundedRectangle(cornerRadius: 3))
            
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
      }
      .task{
        await loadData()
      }
    }
  }
  
  func loadData() async {
    if let topicDetail = topicDetail {
      if let id = topicDetail.id {
        do {
          let data = try await api.getTopicDetail(id: id)
          if let data = data {
            self.topicDetail = data.data
          }
        } catch {
          
        }
      }
    }
  }
  
  func createReply() {
    isReplying = true
    Task {
      if let topicId = topicDetail?.id {
        do {
          let data = try await api.createReply(topicId: topicId, content: replyContent, replyId: nil)
          if let success = data?.success, success {
            replyContent = ""
            await loadData()
          }
        } catch {
          
        }
      }
      isReplying = false
    }
  }
}

struct TopicDetailView_Previews: PreviewProvider {
  static var previews: some View {
    TopicDetailView(
      topicDetail: PreviewData.getTopicDetail()
    )
  }
}
