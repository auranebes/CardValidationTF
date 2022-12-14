//
//  SwiftUIView.swift
//  
//
//  Created by Arslan Abdullaev on 14.12.2022.
//

import SwiftUI
import CardValidationTF

fileprivate struct ValidState {
  var isCvvValid: Bool = false
  var isCardNumberValid: Bool = false
  var isDateExpirationValid: Bool = false
  var isCardHolderNameValid: Bool = false
}

fileprivate struct TextState {
  var cardNo = ""
  var cvv = ""
  var date = ""
  var name = ""
}

struct ContentView: View {
  @State private var text = TextState()
  @State private var isValid = ValidState()
  @State private var cardType = CardBankType.nonIdentified
  @State private var color = Color.gray.opacity(0.3)
  
    var body: some View {
      ZStack {
        color.opacity(0.25).ignoresSafeArea()
        VStack(spacing: 45) {
          Spacer()
          RoundedRectangle(cornerRadius: 12)
            .fill(color)
            .overlay (
              ZStack {
                Image(cardType.textFieldIcon)
                  .aspectRatio(contentMode: .fit)
              }
            )
            .frame(width: 290, height: 200)
          VStack(spacing: 20) {
            showCardNoTF()
            showNameTF()
            HStack {
              showCvvTF()
              Spacer(minLength: 60)
              showDateExpTF()
            }
          }
          .padding()
          Spacer()
        }
      }
      .onChange(of: cardType) { type in
        changeCardBackgroundColor(cardType: type)
      }
    }
  
  private func changeCardBackgroundColor(cardType: CardBankType) {
    switch cardType {
    case .visa:
      self.color = .purple.opacity(0.5)
    case .mastercard:
      self.color = .yellow.opacity(0.5)
    case .maestro:
      self.color = .blue.opacity(0.5)
    case .mir:
      self.color = .green.opacity(0.5)
    case .nonIdentified:
      self.color = .gray.opacity(0.3)
    }
  }
  
  @ViewBuilder
  private func showCardNoTF() -> some View {
    CardValidationTF(text: $text.cardNo, isValid: $isValid.isCardNumberValid, bankCardType: $cardType, tfType: .cardNumber, tfFont: .caption, tfColor: .black.opacity(0.8), subtitle: "Card Number")
      .padding()
      .background (
        Color.gray.opacity(0.1).cornerRadius(15)
      )
      .overlay(
        RoundedRectangle(cornerRadius: 15)
          .stroke(lineWidth: 1)
          .foregroundColor(isValid.isCardNumberValid ? .green : .red.opacity(0.3))
      )
  }
  
  @ViewBuilder
  private func showCvvTF() -> some View {
    CardValidationTF(text: $text.cvv, isValid: $isValid.isCvvValid, bankCardType: $cardType, tfType: .cvv, tfFont: .caption, tfColor: .black.opacity(0.8), subtitle: "CVV/CCV")
      .padding()
      .background (
        Color.gray.opacity(0.1).cornerRadius(15)
      )
      .overlay(
        RoundedRectangle(cornerRadius: 15)
          .stroke(lineWidth: 1)
          .foregroundColor(isValid.isCvvValid ? .green : .red.opacity(0.3))
      )
  }
  
  @ViewBuilder
  private func showDateExpTF() -> some View {
    CardValidationTF(text: $text.date, isValid: $isValid.isDateExpirationValid, bankCardType: $cardType, tfType: .dateExpiration, tfFont: .caption, tfColor: .black.opacity(0.8), subtitle: "Date Exp.")
      .padding()
      .background (
        Color.gray.opacity(0.1).cornerRadius(15)
      )
      .overlay(
        RoundedRectangle(cornerRadius: 15)
          .stroke(lineWidth: 1)
          .foregroundColor(isValid.isDateExpirationValid ? .green : .red.opacity(0.3))
      )
  }
  
  @ViewBuilder
  private func showNameTF() -> some View {
    CardValidationTF(text: $text.name, isValid: $isValid.isCardHolderNameValid, bankCardType: $cardType, tfType: .cardHolder, tfFont: .caption, tfColor: .black.opacity(0.8), subtitle: "Cardholder Name")
      .padding()
      .background (
        Color.gray.opacity(0.1).cornerRadius(15)
      )
      .overlay(
        RoundedRectangle(cornerRadius: 15)
          .stroke(lineWidth: 1)
          .foregroundColor(isValid.isCardHolderNameValid ? .green : .red.opacity(0.3))
      )
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
