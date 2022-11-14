//
//  CreateTopicView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/11/14.
//

import SwiftUI

struct CreateTopicView: View {
  
  @EnvironmentObject var globalState: GlobalState
  
  @State var tab = ""
  
  @State var title = ""
  
  @State var content = ""
  
  @State var isPublishing = false
  
  var body: some View {
    VStack(alignment: .leading) {
      Picker(selection: $tab,
             label: Text("选择板块："),
             content: {
        Text("请选择").tag("")
        Text("分享").tag("share")
        Text("问答").tag("ask")
        Text("招聘").tag("job")
        Text("客户端测试").tag("dev")
      })
      .frame(width: 200)
      .padding()
      
      TextField("标题字数10字以上", text: $title)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
      
      ContentEditor(content: $content)
      
      Button(action: {
        if !isPublishing {
          print("click craete btn")
          createTopic()
        }
      }, label: {
        Text("提交")
          .frame(width: 50, height: 30)
          .foregroundColor(isPublishing ? .black : .white)
          .background(isPublishing ? .gray : .blue)
          .mask(RoundedRectangle(cornerRadius: 3))
      })
      .buttonStyle(BorderlessButtonStyle())
      .padding()
    }
  }
  
  func createTopic() {
    isPublishing = true
    if tab.isEmpty {
      globalState.mainWindowAlert("必须选择一个板块")
    }
    if title.isEmpty {
      globalState.mainWindowAlert("标题不能是空的")
    }
    if content.isEmpty {
      globalState.mainWindowAlert("内容不可为空")
    }
    Task {
      do {
        let data = try await api.createTopic(tab: tab, title: title, content: content)
        if let success = data?.success, success {
          
        }
      } catch {
        
      }
      isPublishing = false
    }
  }
}

struct CreateTopicView_Previews: PreviewProvider {
  static var previews: some View {
    CreateTopicView()
  }
}
