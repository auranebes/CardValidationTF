//
//  Extension + CardValidationTF.swift
//  CardTFValidation
//
//  Created by Arslan Abdullaev on 14.12.2022.
//  Copyright © 2022 auranebes. All rights reserved.
//

import Foundation

extension CardValidationTF {
  
  public static func cardType(from cardNumber: String) -> CardBankType {
    let cleanCardNumber = self.cleanCreditCardNo(cardNumber)
    
    guard cleanCardNumber.count > 0 else {
      return .nonIdentified
    }
    
    let first = String(cleanCardNumber.first!)
    
    guard first != "4" else {

      return .visa
    }
    
    guard first != "6" else {
      return .maestro
    }
    
    guard cleanCardNumber.count >= 2 else {
      return .nonIdentified
    }
    
    let indexTwo = cleanCardNumber.index(cleanCardNumber.startIndex, offsetBy: 2)
    let firstTwo = String(cleanCardNumber[..<indexTwo])
    let firstTwoNum = Int(firstTwo) ?? 0
    
    if firstTwoNum == 35 {
      return .nonIdentified
    } else if firstTwoNum == 34 || firstTwoNum == 37 {
      return .nonIdentified
    } else if firstTwoNum == 50 || (firstTwoNum >= 56 && firstTwoNum <= 69) {
      return .maestro
    } else if (firstTwoNum >= 51 && firstTwoNum <= 55) {
      return .mastercard
    }
    
    guard cleanCardNumber.count >= 4 else {
      return .nonIdentified
    }
    
    let indexFour = cleanCardNumber.index(cleanCardNumber.startIndex, offsetBy: 4)
    let firstFour = String(cleanCardNumber[..<indexFour])
    let firstFourNum = Int(firstFour) ?? 0
    
    if firstFourNum >= 2200 && firstFourNum <= 2204 {
      return .mir
    }
    
    if firstFourNum >= 2221 && firstFourNum <= 2720 {
      return .mastercard
    }
    
    guard cleanCardNumber.count >= 6 else {
      return .nonIdentified
    }
    
    let indexSix = cleanCardNumber.index(cleanCardNumber.startIndex, offsetBy: 6)
    let firstSix = String(cleanCardNumber[..<indexSix])
    let firstSixNum = Int(firstSix) ?? 0
    
    if firstSixNum >= 979200 && firstSixNum <= 979289 {
      return .nonIdentified
    }
    
    return .nonIdentified
  }
  
  public static func cleanCreditCardNo(_ creditCardNo: String) -> String {
    return creditCardNo.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
  }
  
  public static func isCardNumberValid(_ cardNumber: String?) -> Bool {
    guard let cardNumber = cardNumber else {
      return false
    }
    let number = cardNumber.onlyNumbers()
    guard number.count >= 14 && number.count <= 19 else {
      return false
    }
    
    var digits = number.map { Int(String($0))! }
    stride(from: digits.count - 2, through: 0, by: -2).forEach { i in
      var value = digits[i] * 2
      if value > 9 {
        value = value % 10 + 1
      }
      digits[i] = value
    }
    
    let sum = digits.reduce(0, +)
    return sum % 10 == 0
  }
  
  public static func isExpDateValid(_ expDate: String?) -> Bool {
    guard let expDate = expDate else {
      return false
    }
    guard expDate.count == 5 else {
      return false
    }
    
    
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/yy"
    
    guard let date = dateFormatter.date(from: expDate) else {
      return false
    }
    
    var calendar = Calendar.init(identifier: .gregorian)
    calendar.timeZone = TimeZone.current
    
    let dayRange = calendar.range(of: .day, in: .month, for: date)
    var comps = calendar.dateComponents([.year, .month, .day], from: date)
    comps.day = dayRange?.count ?? 1
    comps.hour = 24
    comps.minute = 0
    comps.second = 0
    
    guard let aNewDate = calendar.date(from: comps) else {
      return false
    }
    
    let dateNow = dateFormatter.date(from: "11/22")!
    
    guard aNewDate.compare(dateNow) == .orderedDescending else {
      return false
    }
    
    return true
  }
  
  public static func isCvvValid(_ cvv: String?) -> Bool {
    guard let cvv = cvv else {
      return false
    }
    
    if (cvv.count == 3) {
      return true
    }
    
    return false
  }
}
