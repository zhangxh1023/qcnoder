//
//  AvatarView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/3.
//

import SwiftUI

struct AvatarView: View {
  
  let avatarUrl: String?
  let width: CGFloat
  let height: CGFloat
  
  var body: some View {
    if let url = avatarUrl {
      
      Button(action: {
        print("click button")
      }, label: {
        AsyncImage(url: URL(string: url)) {image in
          image.resizable()
            .frame(width: width, height: height)
            .scaledToFit()
            .mask(RoundedRectangle(cornerRadius: 6))
        } placeholder: {
          Color.gray
        }.frame(width: width, height: height)
      })
      .buttonStyle(StaticButtonStyle())
      
    } else {
      Spacer().frame(width: width, height: height)
    }
    
  }
}

struct AvatarView_Previews: PreviewProvider {
  static var previews: some View {
    AvatarView(
      avatarUrl: "https://avatars.githubusercontent.com/u/227713?v=4&s=120",
      width: 48,
      height: 48
    )
  }
}
