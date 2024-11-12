import DesignSystem
import SwiftUI

public struct ContentView: View {
    public init() {}

    public var body: some View {
        Text("Hello, World!")
            .padding()
                        .background(DesignSystemAsset.Color.primaryColor.swiftUIColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
