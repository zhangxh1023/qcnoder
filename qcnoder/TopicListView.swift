//
//  TopicListView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/9/28.
//

import SwiftUI

struct TopicListView: View {
  
  var topicTab: String
  
  @State var isLoading = true;
  
  var body: some View {
    NavigationView {
      if isLoading {
        ProgressView()
          .frame(minWidth: 400)
      } else {
        Text(topicTab)
      }
    }
    .task {
      await loadData()
    }
  }
  
  func loadData() async {
    isLoading = true;
    do {
      try await Task.sleep(nanoseconds: 1_000_000_000)
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
