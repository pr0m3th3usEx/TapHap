//
//  ApplicationModel.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 03/05/2023.
//

import Foundation

class ApplicationModel: ObservableObject {
    let ownerName: String
    let defaultCoverImageName: String
    
    @Published var events: [Event]
    @Published var rsvpEvents: [Event]
    
    init() {
        events = [
            Event(
                title: "Event 1",
                description: "Test",
                dateTime: Date(),
                owner: "SFSU Gators",
                coverImage: "default",
                location: Location(
                    title: "1 N State Dr",
                    subTitle: "San Francisco, CA 94132",
                    latitude: 37.72667786058989,
                    longitude: -122.48211256627417
                )
            ),
            Event(
                title: "Saturday Night",
                description: "Test",
                dateTime: Date(),
                owner: "ClubX",
                coverImage: "default",
                location: Location(
                    title: "715 Harrison St",
                    subTitle: "San Francisco, CA 94107",
                    latitude: 37.782189582413956,
                    longitude: -122.39766853187258
                )
            ),
            Event(
                title: "Event 3",
                description: "Test",
                dateTime: Date(),
                owner: "DNA",
                coverImage: "default",
                location: Location(
                    title: "375 11th St",
                    subTitle: "San Francisco, CA 94103",
                    latitude: 37.771149696467994,
                    longitude: -122.41268574173462
                )
            )
        ]
        rsvpEvents =  []
        ownerName = "You"
        defaultCoverImageName = "default"
    }
    
    func createEvent(event: Event) {
        if !eventExists(a: event, list: events) {
            events.append(event)
        }
        
    }
    
    func particapteToEvent(event: Event) {
        if !eventExists(a: event, list: rsvpEvents) {
            rsvpEvents.append(event)
        }
    }
    
    private func eventExists(a: Event, list: [Event]) -> Bool {
        for event in list {
            if a.id == event.id {
                return true
            }
        }
        
        return false
    }
    
    func getMyEvents() -> [Event] {
        var myEvents: [Event] = []
        
        for i in 0 ..< events.count {
            if events[i].owner == ownerName {
                myEvents.append(events[i])
            }
        }
        
        return myEvents
    }
}
