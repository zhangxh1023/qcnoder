//
//  ContentEditor.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/11.
//

import SwiftUI
import MarkdownUI

struct ContentEditor: View {
  
  @Binding var content: String
  
  @State private var isPreview: Bool = false
  
  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      Divider()
      
      HStack {
        Button(action: {
          print("click eye")
          isPreview = !isPreview
        }, label: {
          Image(systemName: "eye")
        })
        .buttonStyle(BorderlessButtonStyle())
      }
      .padding()
      
      Divider()
      
      if isPreview {
        Markdown(content,
                 baseURL: URL(string: "https:"))
        .padding()
      } else {
        TextEditor(text: $content)
          .frame(height: 150)
          .padding()
      }
      
      Divider()
    }
  }
}

struct ContentEditor_Previews: PreviewProvider {
  static var previews: some View {
    ContentEditor(content: .constant(""))
  }
}
