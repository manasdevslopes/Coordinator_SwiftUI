//
//  SliderView.swift
//  CoordinatorExample
//
//  Created by MANAS VIJAYWARGIYA on 08/01/25.
//

import SwiftUI

struct SliderView: View {
  @State private var sliderValue: Double = 0.5
  
  var body: some View {
    VStack {
      CustomSlider(value: $sliderValue, range: 0...1, step: 0.01)
      Text("Slider Value: \(sliderValue, specifier: "%.2f")")
    }
  }
}

#Preview {
  SliderView()
}

// Step 1: Create a struct that confirms to UIViewRepresentable
struct CustomSlider: UIViewRepresentable {
  typealias Slider = UISlider
  
  @Binding var value: Double
  var range: ClosedRange<Double>
  var step: Double
  
  // Step 2: Create & Configure UIActivityIndicatorView
  func makeUIView(context: Context) -> Slider {
    let slider = UISlider(frame: .zero)
    slider.maximumValue = Float(range.upperBound)
    slider.minimumValue = Float(range.lowerBound)
    
    // custom thumb image
    let thumbImage = UIImage(systemName: "circle.fill")
    slider.setThumbImage(thumbImage, for: .normal)
    
    // Custom track images
    slider.setMinimumTrackImage(UIImage(named: "minTrack"), for: .normal)
    slider.setMaximumTrackImage(UIImage(named: "maxTrack"), for: .normal)
    
    slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged), for: .valueChanged)
    return slider
  }
  
  // to update UIKit View
  func updateUIView(_ uiView: Slider, context: Context) {
    uiView.value = Float(value)
  }
  
  // Step 3: Optionally implement a Coordinator if needed for interaction handling
  func makeCoordinator() -> Coordinator {
    Coordinator(parent: self)
  }
  class Coordinator: NSObject {
    var parent: CustomSlider
    
    init(parent: CustomSlider) {
      self.parent = parent
    }
    
    @objc func valueChanged(_ sender: UISlider) {
      let steppedValue = round(Double(sender.value) / parent.step) * parent.step
      sender.value = Float(steppedValue) // Update the UISlider's displayed value
      parent.value = steppedValue       // Update the SwiftUI binding
    }
  }
}
