//
//  GlobalState.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/17.
//

import Foundation

class GlobalState: ObservableObject {
  
  @Published var showUserSheetView = false
  
  @Published var user: UserModel?
  
}
