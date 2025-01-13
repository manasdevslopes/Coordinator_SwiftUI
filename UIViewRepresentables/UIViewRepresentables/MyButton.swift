//
//  MyButton.swift
//  UIViewRepresentables
//
//  Created by MANAS VIJAYWARGIYA on 13/01/25.
//

import SwiftUI

struct MyButton: UIViewRepresentable {
  @Binding var title: String
  @Binding var counter: Int
  
  init(title: Binding<String>, counter: Binding<Int>) {
    self._title = title
    self._counter = counter
  }
  
  typealias UIViewType = UIButton
  
  func makeUIView(context: Context) -> UIButton {
    let button = UIButton()
    button.setTitle("\(title) | \(counter)", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.addTarget(context.coordinator, action: #selector(Coordinator.buttonTapped), for: .touchUpInside)
    return button
  }
  
  func updateUIView(_ uiView: UIButton, context: Context) {
    uiView.setTitle("\(title) | \(counter)", for: .normal)
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  class Coordinator: NSObject {
    private var parent: MyButton
    
    init(_ parent: MyButton) {
      self.parent = parent
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
      parent.counter += 1
      parent.title = "Updated State"
    }
  }
}
