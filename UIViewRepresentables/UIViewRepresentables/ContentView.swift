//
//  ContentView.swift
//  UIViewRepresentables
//
//  Created by MANAS VIJAYWARGIYA on 13/01/25.
//

import SwiftUI

struct ContentView: View {
  @State private var counter: Int = 0
  @State private var title: String = "Initial State"
  
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text(title)
      
      MyButton(title: $title, counter: $counter)
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
