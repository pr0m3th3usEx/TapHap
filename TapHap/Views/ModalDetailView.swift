//
//  ModalDetailView.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 18/05/2023.
//

import SwiftUI

struct ModalDetailView: View {
    
    @Binding var show: Bool
    @Binding var event: Event?
    
    @State var isDragging = false
    
    @EnvironmentObject var model: ApplicationModel
    
    @State private var curHeight: CGFloat = 500
    let minHeight: CGFloat = 500
    let maxHeight: CGFloat = 650
    
    let dateFormatter = DateFormatter()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if (show && event != nil) {
                Color
                    .black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        show = false
                    }
                
                mainView
                    .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut(duration: 0.1))
    }
    
    var mainView: some View {
        VStack {
            ZStack {
                Capsule()
                    .frame(width: 40, height: 6)
                    .foregroundColor(.black)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.00001))
            .gesture(dragGesture)
            
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
                
                
                if (event != nil && event!.owner != model.ownerName && !Event.inArray(model.rsvpEvents, event!)) {
                    Button("Participate") {
                        model.particapteToEvent(event: event!)
                        show = false
                    }
                    .buttonStyle(CustomButtonStyle())
                }
            }
                .padding(.horizontal, 30)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
        }
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .padding(.bottom, 35)
            .frame(height: curHeight, alignment: .top)
            .frame(maxWidth: .infinity)
            .background {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.white)
                    Rectangle()
                        .frame(height: curHeight / 2)
                        .foregroundColor(.white)
                }
            }
            .animation(isDragging ? nil : .easeInOut(duration: 0.45))
            .onAppear {
                dateFormatter.dateFormat = "yyyy-MM-dd 'at' HH:mm"
            }
    }
    
    @State private var prevDragTransition = CGSize.zero

    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                if !isDragging {
                    isDragging = true
                }
                
                let dragAmount = val.translation.height - prevDragTransition.height
                
                if (curHeight > maxHeight || curHeight < minHeight) {
                    curHeight -= dragAmount / 6
                } else {
                    curHeight -= dragAmount
                }
                
                
                prevDragTransition = val.translation
            }
            .onEnded { val in
                prevDragTransition = .zero
                isDragging = false
                
                if curHeight > maxHeight {
                    curHeight = maxHeight
                } else if curHeight < minHeight {
                    curHeight = minHeight
                }
            }
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
    @State static var show = true
    @StateObject static var appModel = ApplicationModel()
    
    static var previews: some View {
        ModalDetailView(show: $show, event: $event)
            .environmentObject(appModel)
    }
}
