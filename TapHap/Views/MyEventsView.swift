//
//  MyEventsView.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 08/05/2023.
//

import SwiftUI

struct MyEventsView: View {
    @State private var createNewEventSheet = false
    @State var myEvents: [Event] = [
        Event(
            title: "Event 1",
            description: "Test",
            dateTime: Date(),
            owner: "You",
            coverImage: "default",
            location: Location(
                title: "249, BELLEVUE AVE",
                subTitle: "Daly City",
                latitude: 37.687923,
                longitude: -122.470207
            )
        ),
        Event(
            title: "Event 2",
            description: "Test",
            dateTime: Date(),
            owner: "You",
            coverImage: "default",
            location: Location(
                title: "249, BELLEVUE AVE",
                subTitle: "Daly City",
                latitude: 37.687923,
                longitude: -122.470207
            )
        ),
        Event(
            title: "Event 3",
            description: "Test",
            dateTime: Date(),
            owner: "You",
            coverImage: "default",
            location: Location(
                title: "249, BELLEVUE AVE",
                subTitle: "Daly City",
                latitude: 37.687923,
                longitude: -122.470207
            )
        )
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                List(myEvents, id: \.self) { event in
                    NavigationLink {
                        EventDetailView()
                    } label: {
                        HStack {
                            Image("default")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 120)
                            
                            VStack(alignment: .leading) {
                                Text(event.title)
                                Text("\(event.dateTime.formatted())")
                                Text("By: \(event.owner)")
                            }
                        }
                    }
                }
                .padding(.zero)
                .listStyle(.plain)

            }
            .padding([.trailing])
            .navigationTitle("Your Events")
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
        }
        .sheet(isPresented: $createNewEventSheet) {
            CreateEventView()
        }
    }
}

struct MyEventsView_Previews: PreviewProvider {
    static var previews: some View {
        MyEventsView()
    }
}