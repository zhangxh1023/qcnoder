//
//  CollectBtnView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/7.
//

import SwiftUI

struct CollectBtnView: View {
  
  @EnvironmentObject var globalState: GlobalState
  
  @ObservedObject var topicDetailView: TopicDetailViewModel
  
  var body: some View {
    if globalState.user != nil,
       let isCollect = topicDetailView.topicDetail.isCollect{
      Button(action: {
        print("click collect btn" + accesstoken)
        toggleTopicCollect()
      }, label: {
        ZStack {
          Text(isCollect ? "取消收藏" : "收藏")
            .kerning(3)
            .font(.system(size: 14))
            .foregroundColor(isCollect ? .black : .white)
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
        }
        .background(isCollect ? .gray : .teal)
        .mask(RoundedRectangle(cornerRadius: 3))
      })
      .buttonStyle(BorderlessButtonStyle())
    }
  }
  
  func toggleTopicCollect() {
    Task {
      do {
        if let isCollect = topicDetailView.topicDetail.isCollect,
           let topicId = topicDetailView.topicDetail.id {
          if isCollect {
            let data = try await api.decollectTopic(topicId)
            if let success = data?.success, success {
              topicDetailView.toggleIsCollect()
            } else {
              if globalState.showUserSheetView {
                globalState.userSheetAlert(data?.errorMsg ?? "操作失败")
              } else {
                globalState.mainWindowAlert(data?.errorMsg ?? "操作失败")
              }
            }
          } else {
            let data = try await api.collectTopic(topicId)
            if let success = data?.success, success {
              topicDetailView.toggleIsCollect()
            } else {
              if globalState.showUserSheetView {
                globalState.userSheetAlert(data?.errorMsg ?? "操作失败")
              } else {
                globalState.mainWindowAlert(data?.errorMsg ?? "操作失败")
              }
            }
          }
        }
      } catch {
        
      }
    }
  }
}

struct CollectBtnView_Previews: PreviewProvider {
  static var previews: some View {
    CollectBtnView(topicDetailView: TopicDetailViewModel(topicDetail: TopicDetailModel()))
  }
}
