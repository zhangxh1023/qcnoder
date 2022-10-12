//
//  PersonalView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/11.
//

import SwiftUI

struct PersonalView: View {
  
  @Binding var showPeronalView: Bool
  
  var body: some View {
    VStack {
      HStack { // Back button
        Button(action: {
          showPeronalView = false
        }) {
          Text("< Back")
        }.buttonStyle(BorderlessButtonStyle())
        Spacer()
      } 
      .padding(.horizontal).padding(.vertical, 4)
      Text("personal view!")
    }
  }
}

struct PersonalView_Previews: PreviewProvider {
  static var previews: some View {
    PersonalView(
      showPeronalView: .constant(false)
    )
  }
}
