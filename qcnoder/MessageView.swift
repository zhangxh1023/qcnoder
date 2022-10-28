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
            VStack (alignment: .leading, spacing: 0) {
              Divider()
              HStack {
                Text("新消息")
                  .font(.title3)
                Spacer()
              }
              .padding()
              .mask(RoundedRectangle(cornerRadius: 3))
              Divider()
              
              MessageList(list: message?.hasnotReadMessages)
              
              Spacer()
                .frame(height: 30)
              
              Divider()
              HStack {
                Text("过往消息")
                  .font(.title3)
                Spacer()
              }
              .padding()
              .mask(RoundedRectangle(cornerRadius: 3))
              Divider()
              
              MessageList(list: message?.hasReadMessages)
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
