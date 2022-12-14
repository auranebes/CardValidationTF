//
//  CardBankType.swift
//  CardTFValidation
//
//  Created by Arslan Abdullaev on 14.12.2022.
//  Copyright © 2022 auranebes. All rights reserved.
//

import Foundation

public enum CardBankType {
  case visa
  case mastercard
  case maestro
  case mir
  case nonIdentified
  
  var textFieldIcon: String {
    switch self {
    case .visa:
      return "visa.icon.colorized"
    case .mastercard:
      return "mastercard.icon.colorized"
    case .maestro:
      return "mastercard.icon.colorized"
    case .mir:
      return "mir.icon.colorized"
    case .nonIdentified:
      return "globe.icon"
    }
  }
  
  var regex: String {
    switch self {
      
    case .visa:
      return "^4[0-9]{6,}$"
    case .mastercard:
      return "^5[1-5][0-9]{5,}$"
    case .maestro:
      return "^(5018|5020|5038|5612|5893|6304|6759|6761|6762|6763|0604|6390)\\d+$"
    case .mir:
      return "^220[0-4]\\d+$"
    case .nonIdentified:
      return ""
    }
  }
}
