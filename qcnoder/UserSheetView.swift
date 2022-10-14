//
//  UserSheetView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/14.
//

import SwiftUI

struct UserSheetView: View {
  
  @Environment(\.presentationMode) var mode
  
  var body: some View {
    VStack {
      Button(action: {
        self.mode.wrappedValue.dismiss()
      }, label: {
        Text("退出详情页")
      })
      Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    .frame(width: 800, height: 400)
  }
}

struct UserSheetView_Previews: PreviewProvider {
  static var previews: some View {
    UserSheetView()
  }
}
