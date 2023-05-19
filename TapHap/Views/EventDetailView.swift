//
//  EventDetailView.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 08/05/2023.
//

import SwiftUI

struct EventDetailView: View {
    @EnvironmentObject var model: ApplicationModel
    var event: Event
    
    let dateFormatter = DateFormatter()
    
    init(event: Event) {
        self.event = event
        dateFormatter.dateFormat = "yyyy-MM-dd 'at' HH:mm"
    }
    
    var body: some View {
        VStack {
            ZStack {
                VStack(alignment: .leading) {
                    Image("background")
                        .resizable()
                        .frame(width: .infinity, height: 240)
                    
                    VStack(alignment: .leading, spacing: 14) {
                        Text(event.title)
                            .foregroundColor(Color.black)
                            .font(.title)
                            .bold()
                        
                        Text(event.description)
                            .foregroundColor(Color.black)
                            .font(.headline)
                            .fontWeight(.medium)

                        HStack {
                            Image(systemName: "calendar.badge.clock")
                                .foregroundColor(Color.black)
                            Text("\(dateFormatter.string(from:event.dateTime))")
                                .foregroundColor(Color.black)
                        }
                        
                        HStack {
                            Image(systemName: "location")
                                .foregroundColor(Color.black)
                            Text(event.location.description)
                                .foregroundColor(Color.black)
                        }
                        
                        HStack {
                            Image(systemName: "person.2.fill")
                                .foregroundColor(Color.black)
                            Text(event.owner)
                                .foregroundColor(Color.black)
                        }
                        
                        if (event.owner != model.ownerName && !Event.inArray(model.rsvpEvents, event)) {
                            Button("Participate") {
                                model.particapteToEvent(event: event)
                            }
                            .buttonStyle(CustomButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .center
                )
                .padding([.bottom])
                .background {
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(32)
                        .shadow(
                            color: Color.blue.opacity(0.8),
                            radius: 8,
                            x: 0,
                            y: 2
                         )
                }
            }
            .padding()
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .top
        )
        .background(Color.gray.opacity(0.0))
        .background {
            Image("background")
                .resizable()
                .scaledToFill()
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {

    static var previews: some View {
        EventDetailView(event:  Event(
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
        ))
    }
}
