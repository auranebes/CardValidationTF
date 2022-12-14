//
//  CardTextField.swift
//  CardTFValidation
//
//  Created by Arslan Abdullaev on 14.12.2022.
//  Copyright © 2022 auranebes. All rights reserved.
//

import Foundation

public enum CardTextField {
  case cardNumber
  case cvv
  case cardHolder
  case dateExpiration
  
  var mask: String {
    switch self {
    case .cardNumber:
      return "XXXX XXXX XXXX XXXX"
    case .cvv:
      return "XXX"
    case .cardHolder:
      return ""
    case .dateExpiration:
      return "XX/XX"
    }
  }
}
