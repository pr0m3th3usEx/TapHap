//
//  MyEventsView.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 08/05/2023.
//

import SwiftUI

struct MyEventsView: View {
    @State private var createNewEventSheet = false
    @EnvironmentObject var model: ApplicationModel

    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    if (model.getMyEvents().count > 0) {
                        List(model.getMyEvents(), id: \.self) { event in
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
                        .listStyle(.plain)
                    } else {
                        Text("You have not organized any events yet")
                            .foregroundColor(.white)
                    }
                }
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
                .padding(.top, 128)
            }
            .navigationTitle("Your Events")
            .navigationBarTitleDisplayMode(.automatic)
            .sheet(isPresented: $createNewEventSheet) {
                CreateEventView()
            }
        }
        .ignoresSafeArea()
    }
}

struct MyEventsView_Previews: PreviewProvider {
    @StateObject static var appModel = ApplicationModel()
    
    static var previews: some View {
        MyEventsView()
            .environmentObject(appModel)
    }
}
