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
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ParticipationEventView()
                .tabItem {
                    Label("My tickets", systemImage: "ticket")
                }
                .tag("Tickets")
            
            MapView()
                .tabItem {
                    Label("Map", systemImage: "location.viewfinder")
                }
                .tag("Map")
            
            MyEventsView()
                .tabItem {
                    Label("My Events", systemImage: "calendar")
                }
                .tag("MyEvents")
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color(.black), for: .tabBar)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
