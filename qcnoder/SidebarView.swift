//
//  SidebarView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/9/28.
//

import SwiftUI

struct SidebarView: View {
  private let topics: [[String]] = [["", "全部"], ["ask", "问答"], ["share", "分享"], ["job", "招聘"], ["good", "精华"], ["dev", "客户端测试"]]
  @State var unreadMsgCnt: Int = 0
  
  @EnvironmentObject var globalState: GlobalState
  
  var body: some View {
    List {
      
      Section(header: Text("主题")) {
        ForEach(topics, id: \.self) { topic in
          NavigationLink(topic[1]) {
            TopicListView(tab: topic[0])
          }
        }
      }
      
      Section(header: Text("账户")) {
        NavigationLink(destination: CurrentUserView()) {
          Label("个人", systemImage: "person.crop.circle")
        }
        if globalState.user != nil {
          NavigationLink(destination: MessageView()) {
            let hasUnreadMsg = unreadMsgCnt > 0;
            Label(
              hasUnreadMsg ? String(format: "消息(%d)", arguments: [unreadMsgCnt]) : "消息",
              systemImage: hasUnreadMsg ? "plus.message.fill" : "plus.message"
            )
          }
          NavigationLink(destination: CollectView()) {
            Label("收藏", systemImage: "folder")
          }
        }
      }
      
      Section(header: Text("设置")) {
        NavigationLink(destination: SettingView()) {
          Label("设置", systemImage: "gear.circle")
        }
      }
      
      if globalState.user != nil {
        Section(header: Text("发布话题")) {
          NavigationLink(destination: CreateTopicView()) {
            Label("发布话题", systemImage: "plus.square")
          }
        }
      }
      
    }
    .listStyle(.sidebar)
  }
}

struct SidebarView_Previews: PreviewProvider {
  static var previews: some View {
    SidebarView()
  }
}
