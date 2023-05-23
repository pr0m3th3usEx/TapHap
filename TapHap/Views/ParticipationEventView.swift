//
//  ParticipationEventView.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 08/05/2023.
//

import SwiftUI

struct ParticipationEventView: View {
    @EnvironmentObject var model: ApplicationModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if (model.rsvpEvents.count > 0) {
                    List(model.rsvpEvents, id: \.self) { event in
                        NavigationLink {
                            EventDetailView(event: event)
                        } label: {
                            HStack {
                                Image(event.coverImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 90)
                                
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
                } else {
                    Text("You are not participating in any events")
                        .foregroundColor(.white)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding([.trailing])
            .navigationTitle("My Tickets")
            .background {
                Image("background")
                    .resizable()
                    .scaledToFill()
            }
        }
    }
}

struct ParticipationEventView_Previews: PreviewProvider {
    @StateObject static var appModel = ApplicationModel()
    static var previews: some View {
        ParticipationEventView()
            .environmentObject(appModel)
    }
}
