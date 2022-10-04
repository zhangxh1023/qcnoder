//
//  SidebarView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/9/28.
//

import SwiftUI

struct SidebarView: View {
  private let topics: [[String]] = [["", "全部"], ["ask", "问答"], ["share", "分享"], ["job", "招聘"], ["good", "精华"]]
  @State var unreadMsgCnt: Int = 5
  
  
  var body: some View {
    List {
      
      Section(header: Text("主题")) {
        ForEach(topics, id: \.self) { topic in
          NavigationLink(topic[1]) {
            TopicListView(topicTab: topic[0])
          }
        }
      }
      
      Section(header: Text("账户")) {
        NavigationLink(destination: Personal()) {
          Label("个人", systemImage: "person.crop.circle")
        }
        NavigationLink(destination: Message()) {
          let hasUnreadMsg = unreadMsgCnt > 0;
          Label(
            hasUnreadMsg ? String(format: "消息(%d)", arguments: [unreadMsgCnt]) : "消息",
            systemImage: hasUnreadMsg ? "plus.message.fill" : "plus.message"
          )
        }
      }
      
      Section(header: Text("设置")) {
        NavigationLink(destination: Setting()) {
          Label("设置", systemImage: "gear.circle")
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
