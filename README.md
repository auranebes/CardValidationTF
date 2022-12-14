# CardValidationTF

This package provides cutom TextFields for bank card input data

<table>
    <thead>
        <tr>
            <th>CardNumberTextField</th>
            <th>CardHolderTextField</th>
            <th>CvvTextField</th>
            <th>DateExpirationTextField</th>
        </tr>
    </thead>
</table>

<p><h1 align="left">CardValidationTF</h1></p>

<p><h4>Custom TextFiled to check input of card number, cvv, card holder and card expiration date library written with SwiftUI</h4></p>

</br>

 ![](https://github.com/auranebes/CardValidationTF/blob/main/example.gif)
</br></br>

# Usage
1. Add a 3 binding variables to control Output Text, Card Type and Validation State
2. Define CardValidationTF. 
```swift
struct ContentView: View {

  @State private var text = ""
  @State private var isValid = false
  @State private var cardType = CardBankType.nonIdentified

    var body: some View {
        CardValidationTF(
          text: $text,
          isValid: $isValid,
          bankCardType: $cardType,
          tfType: .cardNumber,
          tfFont: .caption,
          tfColor: .black.opacity(0.8),
          subtitle: "Cardholder Name"
          )
    }
}
```
### Note
This package and my implementation does not provide full assurance in card number validation

### Note2
In version 1.0.0, payment systems are checked such as: MIR, MasterCard, Visa, Maestro

### Required parameters 
`text` - input text from TextField     
`isValid` - result bool variable after checking
`bankCardType` - type of card payment system by card number
`tfType` - type of TextField (card number, cvv and etc.)

### Available customizations - optional parameters   

`tfFont` - custom or system font
`tfColor` - foreground color of font
`subtitle` - custom subtitle in textfield

## Examples

To try CardValidationTF example:
- Open Example folder in package

## Installation

### [Swift Package Manager](https://swift.org/package-manager/)

```swift
dependencies: [
    .package(url: "https://github.com/auranebes/CardValidationTF.git", from: "1.0.0")
]
```

## Requirements

* iOS 13+
* Xcode 11+ 
