//
//  CollectBtnView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/7.
//

import SwiftUI

struct CollectBtnView: View {
  
  let accesstoken: String?
  
  let topicId: String?
  
  let isCollect: Bool
  
  @State var isProgress: Bool = false
  
  var body: some View {
    if let accesstoken = accesstoken {
      if isProgress {
        ProgressView()
          .frame(width: 50, height: 30)
      } else {
        Button(action: {
          print("click collect btn" + accesstoken)
        }, label: {
          ZStack {
            Text(isCollect ? "取消收藏" : "收藏")
              .kerning(3)
              .font(.system(size: 14))
              .foregroundColor(isCollect ? .black : .white)
              .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
          }
          .background(isCollect ? .gray : .teal)
          .mask(RoundedRectangle(cornerRadius: 3))
        })
        .buttonStyle(BorderlessButtonStyle())
      }
    }
  }
}

struct CollectBtnView_Previews: PreviewProvider {
  static var previews: some View {
    CollectBtnView(accesstoken: "xxx", topicId: "xxx", isCollect: false)
  }
}
