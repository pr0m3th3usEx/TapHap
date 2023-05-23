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
                title: "Spring 2023 Rhythm & Harmony Concert",
                description: "The San Francisco Symphony presents a concert of classical music featuring works by Mozart, Beethoven, and Brahms. This is a great opportunity to enjoy some of the world's finest musicians in a beautiful setting.",
                dateTime: Date(timeIntervalSince1970: 1685154600),
                owner: "San Francisco Symphony",
                coverImage: "harmony_concert",
                location: Location(
                    title: "Davies Symphony Hall, 201 Van Ness Ave",
                    subTitle: "San Francisco, CA 94102",
                    latitude: 37.777756232051864,
                    longitude: -122.42062300303691
                )
            ),
            Event(
                title: "FoodieLand Night Market",
                description: "The FoodieLand Night Market is a celebration of Asian food and culture. Enjoy a variety of delicious food, live entertainment, and shopping.",
                dateTime: Date(timeIntervalSince1970: 1685232000),
                owner: "FoodieLand",
                coverImage: "foodie",
                location: Location(
                    title: "Golden Gate Park",
                    subTitle: "San Francisco, CA 94117",
                    latitude: 37.76972486400022,
                    longitude: -122.48627101108688
                )
            ),
            Event(
                title: "Stern Grove Festival",
                description: "The Stern Grove Festival is a free summer concert series featuring a variety of musical genres. Enjoy a day of music in the park with friends and family.",
                dateTime: Date(timeIntervalSince1970: 1691269200),
                owner: "Friends of Stern Grove",
                coverImage: "grove_festival",
                location: Location(
                    title: "Stern Grove, 19th Avenue and Sloat Boulevard",
                    subTitle: "San Francisco, CA 94132",
                    latitude: 37.736423143295184,
                    longitude: -122.47968650108163
                )
            ),
            Event(
                title: "Young Professionals of San Francisco (YPOSF) - May Happy Hour",
                description: "YPOSF is a networking organization for young professionals in San Francisco. Join us for our monthly happy hour to meet new people and make connections.",
                dateTime: Date(timeIntervalSince1970: 1685062800),
                owner: "YPOSF",
                coverImage: "yposf",
                location: Location(
                    title: "The Treasury, 550 Post St",
                    subTitle: "San Francisco, CA 94102",
                    latitude: 37.76763882481443,
                    longitude: -122.40625559971332
                )
            ),
            Event(
                title: "Jane Fonda in Conversation with Manny Jacinto",
                description: "Academy Award-winning actress Jane Fonda will be in conversation with Manny Jacinto, star of The Good Place, at the Castro Theater. This is a rare opportunity to hear from one of Hollywood's most iconic stars.",
                dateTime: Date(timeIntervalSince1970: 1685669400),
                owner: "Manny’s",
                coverImage: "jana_fonda",
                location: Location(
                    title: "Castro Theater, 429 Castro St",
                    subTitle: "San Francisco, CA 94114",
                    latitude: 37.76221138955246,
                    longitude: -122.43480201838177
                )
            ),
            Event(
                title: "Programming Meetup",
                description: "This meetup is a great opportunity to code together. We will also talk about Python. You will also have the opportunity to ask questions and get help from experienced Python developers.",
                dateTime: Date(timeIntervalSince1970: 1685669400),
                owner: "Galvanize",
                coverImage: "dev_meetup",
                location: Location(
                    title: "Galvanize San Francisco, 335 Townsend St",
                    subTitle: "San Francisco, CA 94107",
                    latitude: 37.78763355330109,
                    longitude: -122.39653837143331
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
