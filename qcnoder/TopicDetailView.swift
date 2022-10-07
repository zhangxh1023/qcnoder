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
  
  @State var topicDetail: TopicDetailModel
  
  var body: some View {
    List {
      VStack(alignment: .leading, spacing: 5) {
        Text(topicDetail.title ?? "")
          .font(.title)
        
        HStack {
          Text(String(format: "发布于%@·作者%@·%d次浏览·来自 %@", DateTime.date2BeforeTime(time: topicDetail.createAt ?? ""),
                      topicDetail.author?.loginname ?? "",
                      topicDetail.visitCount ?? 0,
                      topicDetail.tab ?? ""
                     ))
          .font(.system(size: 12))
          .foregroundColor(.gray)
          
          CollectBtnView(accesstoken: accesstoken)
        }
        
        if let content = topicDetail.content {
          Markdown(ContentFormat.mdStaticUrl(content: content))
            .font(.body)
            .fixedSize(horizontal: false, vertical: true)
        }
      }
    }
  }
}

struct TopicDetailView_Previews: PreviewProvider {
  static var previews: some View {
    
    TopicDetailView(topicDetail: PreviewData.getTopicDetail())
  }
}
