//
//  UIViewRepresentableBootcamp.swift
//  SwiftfulThinkingCoordinator
//
//  Created by MANAS VIJAYWARGIYA on 13/01/25.
//

import SwiftUI

// UIViewRepresentable - Convert a UIView from UIKit to SwiftUI
struct UIUIViewRepresentableBootcamp: View {
  @State private var text: String = ""
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(text)
      // BasicUIViewRepresentable().ignoresSafeArea()
      HStack {
        Text("SwiftUI: ")
        TextField("Type here...", text: $text)
          .frame(height: 55).background(Color.gray)
      }
      HStack {
        Text("UIKit: ")
        UITextFieldViewRepresentable(text: $text) // , placeholder: "Type here...", placeholderColor: UIColor.black)
          .updatePlaceholder("Type here...")
          .frame(height: 55)
          .background(Color.gray)
      }
    }.padding()
  }
}

#Preview {
  UIUIViewRepresentableBootcamp()
}

// UIViewRepresentables
struct UITextFieldViewRepresentable: UIViewRepresentable {
  @Binding var text: String
  var placeholder: String
  let placeholderColor: UIColor
  
  init(text: Binding<String>, placeholder: String = "Default placeholder...", placeholderColor: UIColor = .blue) {
    self._text = text
    self.placeholder = placeholder
    self.placeholderColor = placeholderColor
  }
  
  typealias UIViewType = UITextField
  func makeUIView(context: Context) -> UITextField {
    let textField = getTextField()
    textField.delegate = context.coordinator
    return textField
  }
  
  // Send Data from SwiftUI to UIKit
  func updateUIView(_ uiView: UITextField, context: Context) {
    uiView.text = text
  }
  
  // Send Data from UIKit to SwiftUI
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  class Coordinator: NSObject, UITextFieldDelegate {
    private var parent: UITextFieldViewRepresentable
    init(_ parent: UITextFieldViewRepresentable) {
      self.parent = parent
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
      parent.text = textField.text ?? ""
    }
  }
  
  private func getTextField() -> UITextField {
    let textField = UITextField(frame: .zero)
    let placeholder = NSAttributedString(string: placeholder,
                                         attributes: [.foregroundColor: placeholderColor])
    textField.attributedPlaceholder = placeholder
    return textField
  }
  
  func updatePlaceholder(_ text: String) -> UITextFieldViewRepresentable {
    var viewRepresentable = self
    viewRepresentable.placeholder = text
    return viewRepresentable
  }
}
struct BasicUIViewRepresentable: UIViewRepresentable {
  func makeUIView(context: Context) -> some UIView {
    let view = UIView()
    view.backgroundColor = .systemCyan
    return view
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) { }
}
