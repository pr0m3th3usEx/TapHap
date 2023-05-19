//
//  TapHapApp.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 03/05/2023.
//

import SwiftUI

@main
struct TapHapApp: App {
    @StateObject private var appModel = ApplicationModel()

    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.colorScheme, .dark)
                .environmentObject(appModel)
        }
    }
}
