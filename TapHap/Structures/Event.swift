//
//  Event.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 03/05/2023.
//

import Foundation

struct Event: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var description: String
    var dateTime: Date
    var owner: String
    var coverImage: String
    var location: Location
}
