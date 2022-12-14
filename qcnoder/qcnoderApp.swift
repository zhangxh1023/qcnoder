//
//  qcnoderApp.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/9/28.
//

import SwiftUI

var api = QcnoderApi()

@main
struct qcnoderApp: App {
  
  @StateObject var globalState = GlobalState()
  
  var body: some Scene {
    WindowGroup {
      NavigationView{
        SidebarView()
      }
      .frame(minWidth: 1000, minHeight: 600)
      .sheet(isPresented: $globalState.showUserSheetView) {
        UserSheetView()
      }
      .environmentObject(globalState)
      .alert("提示",
             isPresented: $globalState.isMainWindowAlert,
             presenting: globalState.mainWindowAlertText)
      { _ in
      } message: { alertText in
        Text(alertText)
      }
    }
  }
}
