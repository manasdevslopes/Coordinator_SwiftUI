//
//  ContentView.swift
//  CoordinatorExample
//
//  Created by MANAS VIJAYWARGIYA on 08/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
          ActivityIndicator()
          SliderView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
