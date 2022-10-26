//
//  CurrentUserView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/18.
//

import SwiftUI

struct CurrentUserView: View {
  
  @EnvironmentObject private var globalState: GlobalState
  
  @State private var inputAccesstoken = ""
  
  @State private var user: UserModel?
  
  @State private var isLoading = false
  
  var body: some View {
    if isLoading {
      ProgressView()
    } else {
      if let user = user {
        UserView(user: user)
      } else {
        if let _ = globalState.accesstoken {
          ProgressView()
            .task {
              fetchUser()
            }
        } else {
          TextField("accesstoken", text: $inputAccesstoken)
            .padding()
            .frame(width: 300)
          Button(action: {
            globalState.accesstoken = inputAccesstoken
            fetchUser()
          }, label: {
            Text("登录")
          })
        }
      }
    }
  }
  
  private func fetchUser() {
    isLoading = true
    Task {
      let verifyData = try await api.verifyAccesstoken()
      if let loginname = verifyData?.loginname {
        let userData = try await api.getUser(loginname: loginname)
        user = userData?.data
      }
      isLoading = false
    }
  }
}

struct CurrentUserView_Previews: PreviewProvider {
  static var previews: some View {
    CurrentUserView()
  }
}
