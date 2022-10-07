//
//  UserNameView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/5.
//

import SwiftUI

struct UserNameView: View {
  
  let userName: String
  
  var body: some View {
    
    Button(action: {
      print("click username")
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
    UserNameView(userName: "张三丰")
  }
}
