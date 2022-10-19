//
//  UserPopoverView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/14.
//

import SwiftUI

struct UserPopoverView: View {
  
  let loginname: String?
  
  @State var user: UserModel?
  
  @EnvironmentObject private var globalState: GlobalState
  
  var body: some View {
    Group {
      if let user = user {
        HStack {
          Spacer()
          if let avatarUrl = user.avatarUrl {
            AsyncImage(url: URL(string: avatarUrl)) {image in
              image.resizable()
                .frame(width: 96, height: 96)
                .scaledToFit()
                .mask(RoundedRectangle(cornerRadius: 8))
            } placeholder: {
              Color.gray
            }.frame(width: 96, height: 96)
          }
          
          Spacer()
          
          VStack(alignment: .center) {
            Spacer()
            HStack(spacing: 32) {
              createCell(
                text1: String(user.score ?? 0),
                text2: "积分"
              )
              createCell(
                text1: DateTime.date2BeforeTime(time: user.createAt ?? ""),
                text2: "注册时间"
              )
            }
            
            Spacer()
            
            HStack{
              createCell(
                text1: String(user.recentTopics?.count ?? 0),
                text2: "最近创建的话题"
              )
              createCell(
                text1: String(user.recentReplies?.count ?? 0),
                text2: "最近参与的话题"
              )
            }
            
            Button(action: {
              print("click profile")
              globalState.showUserSheetView = true
              globalState.sheetUser = user
            }, label: {
              Text("查看详细信息")
            })
            .padding(.top, 16)
            Spacer()
          }
          Spacer()
        }
      } else {
        ProgressView()
      }
    }
    .frame(width: 420, height: 200)
    .task {
      await getUser()
    }
  }
  
  func getUser() async {
    if let loginname = loginname {
      do {
        let data = try await api.getUser(loginname: loginname)
        user = data?.data
      } catch {
        print("\(error)")
      }
    }
  }
  
  func createCell(text1: String, text2: String) -> some View {
    return VStack {
      Text(text1)
        .font(.title)
        .fontWeight(.bold)
      Text(text2)
        .font(.subheadline)
        .fontWeight(.bold)
        .foregroundColor(.gray)
    }
  }
}

struct UserPopoverView_Previews: PreviewProvider {
  static var previews: some View {
    UserPopoverView(loginname: "zhangxh1023")
  }
}
