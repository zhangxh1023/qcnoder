//
//  UserNameView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/5.
//

import SwiftUI

struct UserNameView: View {
  
  let userName: String
  
  @Binding var showPersonalView: Bool
  
  var body: some View {
    Button(action: {
      print("click username")
      showPersonalView = true
    }, label: {
      Text(userName)
        .font(.system(size: 12))
        .foregroundColor(.gray)
    })
    .buttonStyle(StaticButtonStyle())
  }
  
}

struct UserNameView_Previews: PreviewProvider {
  static var previews: some View {
    UserNameView(userName: "张三丰", showPersonalView: .constant(false))
  }
}
