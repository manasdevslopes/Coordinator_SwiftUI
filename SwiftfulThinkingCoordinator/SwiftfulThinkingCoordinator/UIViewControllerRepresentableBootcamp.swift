//
//  UIViewControllerRepresentableBootcamp.swift
//  SwiftfulThinkingCoordinator
//
//  Created by MANAS VIJAYWARGIYA on 13/01/25.
//

import SwiftUI
import UIKit

struct UIUIViewControllerRepresentableBootcamp: View {
  @State private var showScreen: Bool = false
  @State private var image: UIImage? = nil
  
  var body: some View {
    VStack {
      if let image {
        Image(uiImage: image).resizable().scaledToFit().frame(width: 200, height: 200)
      }
      Button {
        showScreen.toggle()
      } label: {
        Text("Click here")
      }
      .sheet(isPresented: $showScreen) {
        // BasicUIViewControllerRepresentable(labelText: "Hello, SwiftUI!")
        UIImagePickerControllerRepresentable(image: $image, showScreen: $showScreen)
          .ignoresSafeArea()
      }
    }
  }
}

#Preview {
  UIUIViewControllerRepresentableBootcamp()
}

// UIViewControllerRepresentable
struct UIImagePickerControllerRepresentable: UIViewControllerRepresentable {
  @Binding var image: UIImage?
  @Binding var showScreen: Bool
  
  init(image: Binding<UIImage?>, showScreen: Binding<Bool>) {
    self._image = image
    self._showScreen = showScreen
  }
  
  typealias UIViewControllerType = UIImagePickerController
  func makeUIViewController(context: Context) -> UIImagePickerController {
    let vc = UIImagePickerController()
    vc.allowsEditing = false
    vc.delegate = context.coordinator
    return vc
  }
  
  // Send Data from SwiftUI to UIKit
  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
  
  // Send Data from UIKit to SwiftUI
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private var parent: UIImagePickerControllerRepresentable
    
    init(_ parent: UIImagePickerControllerRepresentable) {
      self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      guard let image = info[.originalImage] as? UIImage else { return }
      parent.image = image
      parent.showScreen = false
    }
  }
}

// UIViewControllerRepresentable
struct BasicUIViewControllerRepresentable: UIViewControllerRepresentable {
  let labelText: String
  typealias UIViewController = MyFirstViewController
  
  func makeUIViewController(context: Context) -> UIViewController {
    let vc = MyFirstViewController()
    vc.labelText = labelText
    return vc
  }
  
  func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}

// Custom View Controller
class MyFirstViewController: UIViewController {
  var labelText: String = "Starting Value"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemCyan
    
    let label = UILabel()
    label.text = labelText
    label.textColor = UIColor.white
    
    view.addSubview(label)
    label.frame = view.frame
  }
}
