//
//  ContentView.swift
//  UIKit-SwiftUI-Wrapper
//
//  Created by MANAS VIJAYWARGIYA on 13/01/25.
//

import SwiftUI

struct ContentView: View {
  @State private var title: String = "Awaiting Title"
  @State private var description: String = "Our View Controller hasn't updated our SwiftUI yet..."
  
  var body: some View {
    NavigationStack {
      VStack(alignment: .leading) {
        Text(description)
        ViewControllerWrapper(title: $title, description: $description)
      }
      .padding()
      .navigationTitle(title)
    }
  }
}

#Preview {
  ContentView()
}
