//
//  CnodeResponse.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/3.
//

import Foundation

public struct CnodeResponseModel<T: Decodable>: Decodable {
  
  public let success: Bool
  
  public let data: T?
  
}
