//
//  CardValidationTF.swift
//  CardTFValidation
//
//  Created by Arslan Abdullaev on 14.12.2022.
//

import SwiftUI
import Combine

extension View {
  @ViewBuilder
  func valueChanged<T: Equatable>(value: T, onChange: @escaping (T) -> Void) -> some View {
    if #available(iOS 14.0, tvOS 14.0, macOS 11.0, watchOS 7.0, *) {
      self.onChange(of: value, perform: onChange)
    } else {
      self.onReceive(Just(value)) { value in
        onChange(value)
      }
    }
  }
}

extension String {
  
  func onlyNumbers() -> String {
      return components(separatedBy: CharacterSet.decimalDigits.inverted)
          .joined()
  }
  
  var formattedCreditCard: String {
    return format(with: CardTextField.cardNumber, phone: self)
  }
  
  var formattedExpiredDate: String {
    return format(with: CardTextField.dateExpiration, phone: self)
  }
  
  var formattedCvv: String {
    return format(with: CardTextField.cvv, phone: self)
  }
  
  func format(with maskType: CardTextField, phone: String) -> String {
    let mask = maskType.mask
    let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
    var result = ""
    var index = numbers.startIndex
    for ch in mask where index < numbers.endIndex {
      if ch == "X" {
        result.append(numbers[index])
        index = numbers.index(after: index)
        
      } else {
        result.append(ch)
      }
    }
    return result
  }
}
