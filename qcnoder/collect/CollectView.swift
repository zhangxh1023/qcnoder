//
//  CollectView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/11/14.
//

import SwiftUI

struct CollectView: View {
  
  @EnvironmentObject var globalState: GlobalState
  
  @State var topics: [TopicModel]?
  
  var body: some View {
    if let loginname = globalState.user?.loginname {
      VStack {
        if let topics = topics {
          TopicListView(topics: topics)
        }
      }
      .task {
        await getTopicCollect(loginname: loginname)
      }
    }
  }
  
  func getTopicCollect(loginname: String) async {
    do {
      let data = try await api.getTopicCollect(loginname: loginname)
      if let success = data?.success, success {
        topics = data?.data
      }
    } catch {
      
    }
  }
}

struct CollectView_Previews: PreviewProvider {
  static var previews: some View {
    CollectView()
  }
}
