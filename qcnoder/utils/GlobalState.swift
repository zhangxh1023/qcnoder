//
//  GlobalState.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/17.
//

import Foundation

class GlobalState: ObservableObject {
  
  @Published var showUserSheetView = false
  
  @Published var sheetUser: UserModel?
  
  @Published var accesstoken: String? {
    didSet {
      api.accesstoken = accesstoken
    }
  }
  
  @Published var user: VerifyAccesstokenModel?
  
  @Published var isMainWindowAlert = false
  
  @Published var mainWindowAlertText = ""
  
  @Published var isUserSheetAlert = false
  
  @Published var userSheetAlertText = ""
  
  public func mainWindowAlert(_ text: String) {
    self.mainWindowAlertText = text
    self.isMainWindowAlert = true
  }
  
  public func userSheetAlert(_ text: String) {
    self.userSheetAlertText = text
    self.isUserSheetAlert = true
  }
  
}
