//
//  TopicListView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/9/28.
//

import SwiftUI

struct TopicListView: View {
  
  let pageLimit = 20
  
  var page = 1
  
  var tab: String?
  
  @State var isLoading = false;
  
  @State var topics: [TopicModel]?
  
  var body: some View {
    NavigationView {
      if isLoading {
        ProgressView()
          .frame(minWidth: 350)
      } else {
        List {
          if let topics = topics {
            ForEach(topics) { topic in
              NavigationLink(
                destination: TopicDetailView(
                  topicDetail: TopicModel2Detail.convert(topic: topic)
                ),
                label: {
                  TopicListCellView(
                    topic: topic
                  )
                })
            }
          }
        }
        .frame(minWidth: 350)
      }
    }
    .task {
      if tab != nil {
        await loadData()
      }
    }
  }
  
  func loadData() async {
    if let tab = tab {
      isLoading = true
      do {
        let data = try await api.getTopics(page: page, limit: pageLimit, tab: tab)
        self.topics = data?.data
      } catch {
        
      }
      isLoading = false
    }
  }
}

struct TopicListView_Previews: PreviewProvider {
  static var previews: some View {
    TopicListView(tab: "测试节点主题")
  }
}
