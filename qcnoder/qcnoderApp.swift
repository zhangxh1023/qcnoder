//
//  qcnoderApp.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/9/28.
//

import SwiftUI

@main
struct qcnoderApp: App {
  var body: some Scene {
    WindowGroup {
      NavigationView{
        SidebarView()
      }
      .frame(minWidth: 1000, minHeight: 600)
    }
  }
}
