//
//  CustomButtonStyle.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 18/05/2023.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0.38, green: 0.0, blue: 1.0))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
