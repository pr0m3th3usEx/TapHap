//
//  ApplicationModel.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 03/05/2023.
//

import Foundation

class ApplicationMdoel: ObservableObject {
    let ownerName: String
    let defaultCoverIamgeName: String
    
    var events: [Event]
    var rsvpEvents: [Event]
    

    init() {
        events = []
        rsvpEvents = []
        ownerName = "You"
        defaultCoverIamgeName = "default"
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
    
}
