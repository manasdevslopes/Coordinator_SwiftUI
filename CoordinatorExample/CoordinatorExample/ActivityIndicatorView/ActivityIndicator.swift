//
//  ActivityIndicator.swift
//  CoordinatorExample
//
//  Created by MANAS VIJAYWARGIYA on 08/01/25.
//

import SwiftUI

struct ActivityIndicator: View {
  @State private var isLoading: Bool = false
  
  var body: some View {
    VStack {
      if isLoading {
        ActivityIndicatorView().frame(width: 50, height: 50)
      }
      Button {
        isLoading.toggle()
      } label: {
        Text(isLoading ? "Stop Loading" : "Start Loading")
          .padding().foregroundStyle(.white).background(.blue).clipShape(RoundedRectangle(cornerRadius: 8))
      }
    }
  }
}

#Preview {
  ActivityIndicator()
}

// Step 1: Create a struct that confirms to UIViewRepresentable
struct ActivityIndicatorView: UIViewRepresentable {
  typealias ActivityIndicator = UIActivityIndicatorView
  
  // Step 2: Create & Configure UIActivityIndicatorView
  func makeUIView(context: Context) -> ActivityIndicator {
    let indicatorView = UIActivityIndicatorView(style: .large)
    indicatorView.color = .blue
    indicatorView.startAnimating()
    return indicatorView
  }
  
  func updateUIView(_ uiView: ActivityIndicator, context: Context) {
    // No update needed in this example
    // since we don't change the indicator state dynamically
  }
  
  // Step 3: Optionally implement a Coordinator if needed for interaction handling
  func makeCoordinator() -> Coordinator {
    Coordinator(parent: self)
  }
  class Coordinator: NSObject {
    var parent: ActivityIndicatorView
    
    init(parent: ActivityIndicatorView) {
      self.parent = parent
    }
    
    // No additional methods needed in this example.
  }
}
