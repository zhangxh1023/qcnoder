//
//  UpsView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/11/3.
//

import SwiftUI

struct UpsView: View {
  
  var reply: ReplyModel?
  
  var body: some View {
    if let reply = reply {
      if let upCnt = reply.ups?.count {
        if upCnt > 0 {
          HStack(spacing: 0) {
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
            Text(String(reply.ups?.count ?? 0))
          }
        }
      }
    }
  }
  
  func toggleUps() {
    Task {
      if let replyId = reply?.id {
        do {
          let data = try await api.toggleUps(replyId: replyId)
          if let success = data?.success {
            print("up success")
          }
        } catch {
          print(error)
        }
      }
    }
  }
}

struct UpsView_Previews: PreviewProvider {
  static var previews: some View {
    UpsView(reply: nil)
  }
}
