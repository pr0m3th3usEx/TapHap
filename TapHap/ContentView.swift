//
//  ContentView.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 03/05/2023.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var selectedTab = "Map"
    @EnvironmentObject var model: ApplicationModel

    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                ParticipationEventView()
                    .tabItem {
                        Label("My tickets", systemImage: "ticket")
                    }
                    .tag("Tickets")
                    .badge(model.rsvpEvents.count)
                
                MapView()
                    .tabItem {
                        Label("Map", systemImage: "location.viewfinder")
                    }
                    .tag("Map")
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color.yellow, for: .tabBar)
                
                MyEventsView()
                    .tabItem {
                        Label("My Events", systemImage: "ticket")
                    }
                    .tag("My Events")
                    .badge(model.getMyEvents().count)
            }
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(Color.black, for: .tabBar)
        }
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static var appModel = ApplicationModel()
    
    static var previews: some View {
        ContentView()
            .environmentObject(appModel)
    }
}
