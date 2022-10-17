//
//  UserView.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/14.
//

import SwiftUI

struct UserView: View {
  
  var user: UserModel?
  
  @State private var isGithubNameHover = false
  
  var body: some View {
    if let user = user {
      NavigationView {
        List {
          HStack {
            if let avatarUrl = user.avatarUrl {
              AvatarView(avatarUrl: avatarUrl,
                         loginname: user.loginname,
                         width: 48,
                         height: 48,
                         radius: 4)
            }
            UserNameView(userName: user.loginname)
          }
          HStack {
            Text("当前积分: \(String(user.score ?? 0))")
            Text("注册时间: \(DateTime.date2BeforeTime(time: user.createAt ?? ""))")
          }
          
          if let githubUsername = user.githubUsername {
            Link(
              destination:
                URL(string: "https://github.com/\(githubUsername)")!,
              label: {
                Image(isGithubNameHover ? "github_icon_black" : "github_icon_gray")
                  .resizable()
                  .frame(width: 13, height: 13)
                  .scaledToFit()
                Text("@\(githubUsername)")
                  .font(.system(size: 13))
                  .foregroundColor(isGithubNameHover ? .black : .gray)
              }
            )
            .onHover(perform: { hover in
              isGithubNameHover = hover
            })
          }
          
          Section(header: Text("最近创建的话题").font(.title2)) {
            if let recentTopics = user.recentTopics {
              ForEach(recentTopics) { topic in
                NavigationLink(destination: {
                  TopicDetailView(
                    topicDetail: TopicDetailModel(id: topic.id ?? nil)
                  )
                }, label: {
                  if let avatarUrl = topic.author?.avatarUrl {
                    AvatarView(avatarUrl: avatarUrl,
                               loginname: topic.author?.loginname,
                               width: 24,
                               height: 24,
                               radius: 2)
                  }
                  Text(topic.title ?? "")
                    .lineLimit(1)
                  Spacer()
                  Text(DateTime.date2BeforeTime(time: topic.lastReplyAt ?? ""))
                })
              }
            }
          }
          
          Section(header: Text("最近参与的话题").font(.title2)) {
            if let recentReplies = user.recentReplies {
              ForEach(recentReplies) { topic in
                NavigationLink(destination: {
                  TopicDetailView(
                    topicDetail: TopicDetailModel(id: topic.id ?? nil)
                  )
                }, label: {
                  if let avatarUrl = topic.author?.avatarUrl {
                    AvatarView(avatarUrl: avatarUrl,
                               loginname: topic.author?.loginname,
                               width: 24,
                               height: 24,
                               radius: 2)
                  }
                  Text(topic.title ?? "")
                    .lineLimit(1)
                  Spacer()
                  Text(DateTime.date2BeforeTime(time: topic.lastReplyAt ?? ""))
                })
              }
            }
          }
        }
        .frame(minWidth: 350)
      }
    } else {
      ProgressView()
    }
  }
}

struct UserView_Previews: PreviewProvider {
  static var previews: some View {
    UserView(user: nil)
  }
}
