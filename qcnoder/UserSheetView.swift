//
//  UserSheetView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/14.
//

import SwiftUI

struct UserSheetView: View {
  
  @Environment(\.presentationMode) var mode
  
  @EnvironmentObject private var globalState: GlobalState
  
  var body: some View {
    VStack(spacing: 0) {
      UserView(user: globalState.user)
      Divider()
      HStack {
        Spacer()
        Button(action: {
          self.mode.wrappedValue.dismiss()
        }, label: {
          Text("退出详情页")
        })
        .padding(10)
      }
    }
    .frame(width: 900, height: 540)
  }
}

struct UserSheetView_Previews: PreviewProvider {
  static var previews: some View {
    UserSheetView()
  }
}
