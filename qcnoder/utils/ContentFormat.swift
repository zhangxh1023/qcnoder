//
//  CnodeStaticUrl.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/7.
//

import Foundation

public struct ContentFormat {
  
  public static func mdStaticUrl(content: String) -> String {
    //    ![yuque_diagram.jpg](//static.cnodejs.org/FlRpbwKzQWfj6vKKPI7vRILJ7aqk)
    var ret = content
    let pattern = "(!\\[.+?\\]\\(//static.cnodejs.org/.+?\\))"
    do {
      let regex = try NSRegularExpression.init(pattern: pattern, options: [])
      let matches = regex.matches(in: ret, options: [], range: NSRange(location: 0, length: ret.count))
      
      for item in matches {
        let original = (content as NSString).substring(with: item.range)
        let newStr = original.replacingOccurrences(of: "//static.cnodejs.org", with: "https://static.cnodejs.org")
        ret = ret.replacingOccurrences(of: original, with: newStr)
      }
    } catch {
      return content
    }
    return ret
  }
  
}
