//
//  CollectBtnView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/7.
//

import SwiftUI

struct CollectBtnView: View {
  
  let accesstoken: String?
  
  var body: some View {
    ZStack {
      Text("收藏")
        .font(.system(size: 12))
        .foregroundColor(.white)
    }
    .frame(width: 30, height: 18)
    .background(.green)
    .mask(RoundedRectangle(cornerRadius: 3))
  }
}

struct CollectBtnView_Previews: PreviewProvider {
  static var previews: some View {
    CollectBtnView(accesstoken: "xxx")
  }
}
