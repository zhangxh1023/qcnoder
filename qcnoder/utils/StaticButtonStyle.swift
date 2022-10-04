//
//  StaticButtonStyle.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/4.
//

import Foundation
import SwiftUI

struct StaticButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
  }
}
