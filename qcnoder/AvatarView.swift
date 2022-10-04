//
//  AvatarView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/3.
//

import SwiftUI

struct AvatarView: View {
  
  let avatarUrl: String?
  
  var body: some View {
    if let url = avatarUrl {
      
      Button(action: {
        print("click button")
      }, label: {
        AsyncImage(url: URL(string: url)) {image in
          image.resizable()
            .frame(width: 24, height: 24)
            .scaledToFit()
            .mask(RoundedRectangle(cornerRadius: 8))
        } placeholder: {
          Color.gray
        }

      })
      .buttonStyle(StaticButtonStyle())
      
    } else {
      Spacer().frame(width: 24, height: 24)
    }
    
  }
}

struct AvatarView_Previews: PreviewProvider {
  static var previews: some View {
    AvatarView(avatarUrl: "https://avatars.githubusercontent.com/u/227713?v=4&s=120")
  }
}
