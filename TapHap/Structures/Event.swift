//
//  Event.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 03/05/2023.
//

import Foundation

struct Event: Identifiable, Hashable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var dateTime: Date
    var owner: String
    var coverImage: String
    var location: Location
    
    static func inArray(_ events: [Event], _ event: Event) -> Bool {
        for index in 0 ..< events.count {
            if events[index].id == event.id {
                return true
            }
        }
        
        return false
    }
}
