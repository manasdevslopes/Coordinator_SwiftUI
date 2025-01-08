# What is Coordinator ?
- In simple words, a Coordinator is like a middleman that helps SwiftUI & UIKit to talk to each other. When we use UIKit components in SwiftUI, the Coordinator handles the communication between the two frameworks, managing events and updates.

# What is the Delegate Pattern ?
- The delegate pattern is a way for one object to communicate with another object when certain events happened. Think of it like having an assistant (The delegate) who takes care of specific tasks for you (The main object). In our case, UIKit components often use delegates to handles user interactions and updates, and the Coordinator acts as its assistant, passing information back to SwiftUI.

# How UIViewRepresentable works ?
- Purpose: UIViewRepresentable is a protocol in SwiftUI that allows you to integrate UIKit components (which are based on UIView in UIKit) into SwiftUI views.
- Wrapper for UIKit Views: When a struct conforms to UIViewRepresentable, creating a bridge between SwiftUI and UIKit. SwiftUI doesn't directly supports UIKit views, so this protocol acts as a translator.
- Two Main methods:
  makeUIView(context: ): This method where you create and configure your UIKit View (UIView, UIButton, UITextField, etc...). It's like setting up the view in UIKit's world.
  updateUIView(_:context:): This method is called whenever SwiftUI needs to update the UIKit view based on changes in SwiftUI's state or data bindings. It's how SwiftUI keeps the UIKit view in sync with its own state.
- State Management: We can use SwiftUI's @State, @Binding or other state management techniques to pass data back & forth between SwiftUI & UIKit View. For eg. updating a label's text in a UILabel from a SwiftUI @State variable.
- Coordinator (Optional): Sometimes we need to handle interactions or delegate methods of UIKit views. We use a nested Coordinator class inside our UIViewRepresentable struct to manage these interactions. The Coordinator acts as a delegate or data source for the UIKit View.

- Integration with SwiftUI Views: Once we defined our UIViewRepresentable struct, we can use just like any other SwiftUI View in our SwiftUI hierarchy. SwiftUI handles the layout & positioning of our UIKit-based view seamlessly. 

