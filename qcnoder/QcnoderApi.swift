//
//  QcnoderApi.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/2.
//

import Foundation

public struct QcnoderApi {
  
  public var accesstoken: String?
  
  private let remoteUrl = "https://cnodejs.org/api/v1"
  
  public init (accesstoken: String? = nil) {
    self.accesstoken = accesstoken
  }
  
  private func request<T>(httpMethod: String = "GET", url: String, args: [String: Any]? = nil, decodeClass: T.Type) async throws -> (
    T?, URLResponse?
  ) where T : Decodable {
    let urlComponents = NSURLComponents(string: url)!
    
    if (httpMethod != "POST" && args != nil) {
      urlComponents.queryItems = args?.map({ (k, v) in
        NSURLQueryItem(name: k, value: "\(v)")
      }) as [URLQueryItem]?
    }
    
    guard let requestUrl = urlComponents.url else {
      return (nil, nil)
    }
    
    var request = URLRequest(url: requestUrl)
    request.httpMethod = httpMethod
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    if let accessToken = accesstoken {
      request.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
    }
    
    if httpMethod == "POST" && args != nil{
      request.httpBody = try? JSONSerialization.data(withJSONObject: args as Any)
    }
    
    let (data, response) = try await URLSession.shared.data(for: request)
    
    let decoder = JSONDecoder()
    
    let obj = try decoder.decode(decodeClass.self, from: data)
    
    return (obj, response)
  }
  
  /**
   获取主题
   */
  public func getTopics(page: Int, limit: Int, tab: String) async throws -> CnodeResponseModel<[TopicModel]>? {
    var args: [String: Any] = [
      "page": page,
      "limit": limit,
      "mdrender": false
    ]
    if !tab.isEmpty {
      args["tab"] = tab
    }
    let (data, _) = try await request(
      url: remoteUrl + "/topics",
      args: args,
      decodeClass: CnodeResponseModel<[TopicModel]>.self
    )
    return data
  }
  
  /**
    获取主题详情
   */
  public func getTopicDetail(id: String) async throws -> CnodeResponseModel<TopicDetailModel>? {
    var args: [String: Any] = [
      "mdrender": false
    ]
    if let accesstoken = accesstoken {
      args["accesstoken"] = accesstoken
    }
    let (data, _) = try await request(
      url: remoteUrl + "/topic/" + id,
      args: args,
      decodeClass: CnodeResponseModel<TopicDetailModel>.self
    )
    return data
  }
  
  /**
    获取用户信息
   */
  public func getUser(loginname: String) async throws -> CnodeResponseModel<UserModel>? {
    let (data, _) = try await request(
      url: remoteUrl + "/user/" + loginname,
      decodeClass: CnodeResponseModel<UserModel>.self
    )
    return data
  }
  
  /**
   验证 accessToken 的正确性
   */
  public func verifyAccesstoken() async throws -> CnodeResponseModel<VerifyAccesstokenModel>? {
    let (data, _) = try await request(
      httpMethod: "POST",
      url: remoteUrl + "/accesstoken",
      decodeClass: CnodeResponseModel<VerifyAccesstokenModel>.self
    )
    return data
  }

}
