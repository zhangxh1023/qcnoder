//
//  MessageCell.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/28.
//

import SwiftUI

struct MessageCell: View {
  
  let list: [MessageItemModel]?
  
  var body: some View {
    if let list = list {
      ForEach(list) {item in
        HStack(spacing: 2) {
          UserNameView(userName: item.author?.loginname ?? "")
          Text("在话题")
          Button(action: {
            print("click topic")
          }, label: {
            Text(item.topic?.title ?? "")
          })
          .buttonStyle(BorderlessButtonStyle())
          Text("中\(item.type == "at" ? "@" : "回复")了你")
        }
        .padding()
        Divider()
      }
    }
  }
}

struct MessageCell_Previews: PreviewProvider {
  static var previews: some View {
    MessageCell(list: nil)
  }
}
