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
  
  @State var topicDetail: TopicDetailModel?
  
  @State var isLoading = true
  
  var body: some View {
    if let topicDetail = topicDetail {
      List {
        VStack(alignment: .leading, spacing: 5) {
          Text(topicDetail.title ?? "")
            .font(.title)
          
          HStack {
            Text(String(format: "发布于%@·作者%@·%d次浏览·来自 %@", DateTime.date2BeforeTime(time: topicDetail.createAt ?? ""),
                        topicDetail.author?.loginname ?? "",
                        topicDetail.visitCount ?? 0,
                        TabConstant.getText(tab: topicDetail.tab ?? "")
                       ))
            .font(.system(size: 12))
            .foregroundColor(.gray)
            Spacer()
            CollectBtnView(accesstoken: accesstoken,
                           topicId: topicDetail.id,
                           isCollect: topicDetail.isCollect ?? false)
          }
          
          Divider()
          if let content = topicDetail.content {
            Markdown(ContentFormat.mdStaticUrl(content: content))
              .font(.body)
              .fixedSize(horizontal: false, vertical: true)
              .padding()
          }
          
          if isLoading {
            ProgressView()
          } else {
            CommentListView(topicDetail: topicDetail)
          }
        }
      }
      .task{
        await loadData()
      }
    }
  }
  
  func loadData() async {
    isLoading = true
    if let topicDetail = topicDetail {
      if let id = topicDetail.id {
        do {
          let data = try await api.getTopicDetail(id: id, accesstoken: "")
          if let data = data {
            self.topicDetail = data.data
          }
        } catch {
          
        }
      }
    }
    isLoading = false
  }
}

struct TopicDetailView_Previews: PreviewProvider {
  static var previews: some View {
    
    TopicDetailView(topicDetail: PreviewData.getTopicDetail())
  }
}
