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
            VStack(spacing: 14) {
                ScrollView {
                    if (model.rsvpEvents.count > 0) {
                        //                    List(model.rsvpEvents, id: \.self) { event in
                        ForEach(model.rsvpEvents) { event in
                            NavigationLink {
                                EventDetailView(event: event)
                            } label: {
                                HStack {
                                    Image(event.coverImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 125, height: 130)
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text(event.title)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.leading)
                                            .fontWeight(.medium)
                                        Text("\(event.dateTime.formatted())")
                                            .foregroundColor(.black)
                                        Text("By: \(event.owner)")
                                            .foregroundColor(.black)
                                    }
                                    .frame(alignment: .leading)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(minHeight: 100)
                                .background {
                                    RoundedRectangle(cornerRadius: 30)
                                        .foregroundColor(Color.white)
                                }
                                
                            }
                        }
                        .padding(.horizontal)
                    } else {
                        Text("You are not participating in any events")
                            .foregroundColor(.white)
                    }
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.vertical)
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
