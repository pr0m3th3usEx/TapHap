//
//  MapView.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 08/05/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var createNewEventSheet = false
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.77393972, longitude: -122.431297),
        span:  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )

    var body: some View {
        NavigationStack {
            VStack {
                Map(coordinateRegion: $mapRegion)
                    .frame(width: .infinity, height: 550)

            }
            .padding([.top, .leading, .trailing])
            .navigationTitle("TapHap")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        createNewEventSheet = true
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                            Text("Create event")
                        }
                    }
                }
            }
            .sheet(isPresented: $createNewEventSheet) {
                CreateEventView()
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
