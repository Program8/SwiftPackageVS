//
//  CustomButton.swift
//
//
//  Created by Vijay Sachan on 3/28/25.
//

import SwiftUI

public struct CustomButton: View {
    // Define properties for custom button
    var title: String
    var backgroundColor: Color
    var textColor: Color
    var action: () -> Void  // Action to be performed when the button is pressed
    public init(title: String, backgroundColor: Color, textColor: Color, action: @escaping () -> Void) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.action = action
    }
    // Define the body of the view
    public var body: some View {
        Button(action: action) {
                    Text(title)
                        .font(.headline)
                        .padding()
                        .foregroundColor(textColor)
                        .background(backgroundColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    CustomButton(title: "Click Me", backgroundColor: .blue, textColor: .white) {
                print("Button tapped!")
            }
            .previewLayout(.sizeThatFits)
            .padding()
}
