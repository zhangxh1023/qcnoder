//
//  TopicListView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/9/28.
//

import SwiftUI

var api = QcnoderApi()

struct TopicListView: View {
  
  let pageLimit = 20
  
  var topicTab: String
  var page = 1
  
  @State var isLoading = true;
  @State var topics: [TopicModel]?
  
  @State var showPersonalView = false
  
  @State var load = false
  
  var body: some View {
    if showPersonalView {
      PersonalView(
        showPeronalView: $showPersonalView
      )
      .transition(
        AnyTransition.move(edge: .leading)
      )
    } else {
      NavigationView {
        if isLoading {
          ProgressView()
            .frame(minWidth: 400)
        } else {
          List {
            if let topics = topics {
              ForEach(topics) { topic in
                NavigationLink(
                  destination: TopicDetailView(
                    topicDetail: TopicModel2Detail.convert(topic: topic),
                    showPersonalView: $showPersonalView
                  ),
                  label: {
                    TopicListCellView(
                      topic: topic,
                      showPersonalView: $showPersonalView
                    )
                  })
              }
            }
          }
          .frame(width: 400)
        }
      }
      .task {
        if !load {
          await loadData()
        }
      }
    }
  }
  
  func loadData() async {
    load = true
    isLoading = true;
    do {
      let data = try await api.getTopics(page: page, limit: pageLimit, tab: topicTab)
      self.topics = data?.data
    } catch {
      
    }
    isLoading = false;
  }
}

struct TopicListView_Previews: PreviewProvider {
  static var previews: some View {
    TopicListView(topicTab: "测试节点主题")
  }
}
