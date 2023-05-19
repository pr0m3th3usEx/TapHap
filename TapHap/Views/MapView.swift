//
//  MapView.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 08/05/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var model: ApplicationModel
    @State private var createNewEventSheet = false
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.77393972, longitude: -122.431297),
        span:  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )

    @State var selectedEvent: Event? = nil;
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Map(coordinateRegion: $mapRegion, annotationItems: model.events) { event in
                        MapAnnotation(coordinate: event.location.coordinate) {
                            Image("EventPoint")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .onTapGesture {
                                    selectedEvent = event
                                }
                            
                        }
                        
                    }
                    .frame(width: .infinity, height: 500)
                    
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
                .background {
                    Image("background")
                        .resizable()
                        .scaledToFill()
                }
                .sheet(isPresented: $createNewEventSheet) {
                    CreateEventView()
                }
                
                ModalDetailView(event: $selectedEvent)
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    @StateObject static var appModel = ApplicationModel()
    static var previews: some View {
        MapView()
            .environmentObject(appModel)
    }
}
