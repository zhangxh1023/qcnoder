//
//  MessageView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/11.
//

import SwiftUI

struct MessageView: View {
  
  @EnvironmentObject private var globalState: GlobalState
  
  @State var isLoading = false;
  
  @State var message: MessageModel?
  
  var body: some View {
    if let _ = globalState.accesstoken {
      Group {
        if isLoading {
          ProgressView()
        } else {
          List {
            Text("新消息")
            if let notRead = message?.hasnotReadMessages {
              ForEach(notRead) {item in
                Text("\(item.author?.loginname ?? "")在话题\(item.topic?.title ?? "")中\(item.type == "at" ? "@" : "回复")了你");
              }
            }
            Text("过往消息")
            if let read = message?.hasReadMessages {
              ForEach(read) {item in
                Text("\(item.author?.loginname ?? "")在话题\(item.topic?.title ?? "")中\(item.type == "at" ? "@" : "回复")了你");
              }
            }
          }
        }
      }
      .task {
        await loadData()
      }
    }
  }
  
  func loadData() async {
    isLoading = true
    do {
      let data = try await api.getMessage()
      message = data?.data
    } catch {
      
    }
    isLoading = false
  }
}

struct MessageView_Previews: PreviewProvider {
  static var previews: some View {
    MessageView()
  }
}
