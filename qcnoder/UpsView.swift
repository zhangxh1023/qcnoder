//
//  UpsView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/11/3.
//

import SwiftUI

struct UpsView: View {
  
  @Binding var isHover: Bool
  
  @ObservedObject var replyView: ReplyViewModel
  
  @EnvironmentObject private var globalState: GlobalState
  
  init(replyView: ReplyViewModel, isHover: Binding<Bool>) {
    self._isHover = isHover
    self.replyView = replyView
  }
  
  var body: some View {
    let reply = replyView.reply
    if let upCnt = reply.ups?.count, upCnt > 0 {
      HStack(spacing: 0) {
        upButton
        Text(String(reply.ups?.count ?? 0))
      }
    } else if globalState.accesstoken != nil {
      if isHover {
        upButton
      }
    }
  }
  
  @ViewBuilder
  private var upButton: some View {
    let reply = replyView.reply
    Button(action: {
      toggleUps()
    }, label: {
      if let isUped = reply.isUped, isUped {
        Image(systemName: "hand.thumbsup.fill")
      } else {
        Image(systemName: "hand.thumbsup")
      }
    })
    .buttonStyle(BorderlessButtonStyle())
  }
  
  func toggleUps() {
    Task {
      let reply = replyView.reply
      if let id = globalState.user?.id {
        if let replyId = reply.id {
          do {
            let data = try await api.toggleUps(replyId: replyId)
            if let success = data?.success, success {
              print("up success")
              replyView.toggleIsUped(id: id)
            }
          } catch {
            print(error)
          }
        }
      }
    }
  }
}

struct UpsView_Previews: PreviewProvider {
  static var previews: some View {
    UpsView(replyView: ReplyViewModel(reply: ReplyModel()), isHover: .constant(true))
  }
}
