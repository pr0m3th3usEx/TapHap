//
//  ModalDetailView.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 18/05/2023.
//

import SwiftUI

struct ModalDetailView: View {
    
    @Binding var event: Event?
    
    
    let dateFormatter = DateFormatter()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if (event != nil) {
                Color
                    .black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        event = nil
                    }
                
                mainView
                    .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut(duration: 0.5))
    }
    
    var mainView: some View {
        VStack {
            VStack(alignment: .leading, spacing: 14) {
                Text(event!.title)
                    .foregroundColor(Color.black)
                    .font(.title)
                    .bold()
                
                Text(event!.description)
                    .foregroundColor(Color.black)
                    .font(.headline)
                    .fontWeight(.medium)
                
                HStack {
                    Image(systemName: "calendar.badge.clock")
                        .foregroundColor(Color.black)
                    Text("\(dateFormatter.string(from:event!.dateTime))")
                        .foregroundColor(Color.black)
                }
                
                HStack {
                    Image(systemName: "location")
                        .foregroundColor(Color.black)
                    Text(event!.location.description)
                        .foregroundColor(Color.black)
                }
                
                HStack {
                    Image(systemName: "person.2.fill")
                        .foregroundColor(Color.black)
                    Text(event!.owner)
                        .foregroundColor(Color.black)
                }
                
                //                if (event.owner != model.ownerName && !Event.inArray(model.rsvpEvents, event)) {
                //                    Button("Participate") {
                //                        model.particapteToEvent(event: event)
                //                    }
                //                    .buttonStyle(CustomButtonStyle())
                //                }
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
        .frame(height: 400)
        .frame(maxWidth: .infinity)
        .background(Color.white)
    }
}

struct ModalDetailView_Previews: PreviewProvider {
    @State static var event: Event? = Event(
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
    );

    static var previews: some View {
        ModalDetailView(event: $event)
    }
}
