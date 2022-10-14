//
//  AvatarView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/3.
//

import SwiftUI

struct AvatarView: View {
  
  let avatarUrl: String?
  let loginname: String?
  let width: CGFloat
  let height: CGFloat
  let radius: CGFloat
  
  @State private var showPopover = false
  
  var body: some View {
    if let url = avatarUrl {
      
      Button(action: {
        showPopover = true
      }, label: {
        AsyncImage(url: URL(string: url)) {image in
          image.resizable()
            .frame(width: width, height: height)
            .scaledToFit()
            .mask(RoundedRectangle(cornerRadius: radius))
        } placeholder: {
          Color.gray
        }.frame(width: width, height: height)
      })
      .buttonStyle(BorderlessButtonStyle())
      .popover(isPresented: $showPopover, content: {
        UserPopoverView(loginname: loginname)
      })
      
    } else {
      Spacer().frame(width: width, height: height)
    }
    
  }
}

struct AvatarView_Previews: PreviewProvider {
  static var previews: some View {
    AvatarView(
      avatarUrl: "https://avatars.githubusercontent.com/u/227713?v=4&s=120",
      loginname: "zhangxh1023",
      width: 48,
      height: 48,
      radius: 6
    )
  }
}
