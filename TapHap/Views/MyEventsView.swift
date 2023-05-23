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
                
                ScrollView {
                    VStack {
                        if (model.getMyEvents().count > 0) {
                            ForEach(model.getMyEvents()) { event in
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
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.top, 128)
                }
                .frame(maxWidth: .infinity)
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
