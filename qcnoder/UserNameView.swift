//
//  UserNameView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/5.
//

import SwiftUI

struct UserNameView: View {
  
  let userName: String?
  
  @State private var showPopover = false;
  
  var body: some View {
    Button(action: {
      showPopover = true
    }, label: {
      Text(userName ?? "")
        .font(.system(size: 12))
        .foregroundColor(.gray)
    })
    .buttonStyle(BorderlessButtonStyle())
    .popover(isPresented: $showPopover, content: {
      UserPopoverView(loginname: userName)
    })
  }
  
}

struct UserNameView_Previews: PreviewProvider {
  static var previews: some View {
    UserNameView(userName: "张三丰")
  }
}
