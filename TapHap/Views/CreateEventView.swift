//
//  CreateEventView.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 08/05/2023.
//

import SwiftUI
import MapKit

struct CreateEventView: View {
    @EnvironmentObject var model: ApplicationModel
    
    @State var titleInput: String = ""
    @State var descriptionInput: String = ""
    @State var date: Date = Date()
    @State var location: Location? = nil

    @State private var path = NavigationPath()

    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.77393972, longitude: -122.431297),
        span:  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )


    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2023, month: 5, day: 1)
        let endComponents = DateComponents(year: 2026, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Close") {
                    dismiss()
                }
            }
        
            NavigationStack(path: $path) {
                VStack(spacing: 32) {

                    Text("Basic information")

                    VStack {

                        VStack(alignment: .leading) {
                            Text("Title: ")
                            TextField("Title", text: $titleInput)
                                .textFieldStyle(.roundedBorder)
                        }

                        VStack(alignment: .leading) {
                            Text("Description: ")
                            TextField("Description", text: $descriptionInput, axis: .vertical)
                                .textFieldStyle(.roundedBorder)
                                .multilineTextAlignment(.leading)
                                .lineLimit(7)
                        }

                        DatePicker(
                            "Event date: ",
                            selection: $date,
                            in: dateRange,
                            displayedComponents: [.date, .hourAndMinute]
                        )
                    }


                    Text("Location")

                    VStack(spacing: 16) {
                        if location != nil {
                            Text("\(location!.title), \(location!.subTitle)")

                            Map(
                                coordinateRegion: $mapRegion,
                                annotationItems: (location == nil ? [] : [location!]) as! [Location]) { l in

                                MapAnnotation(coordinate: l.coordinate) {
                                    Image(systemName: "pin.circle.fill")
                                        .font(.title2)
                                        .foregroundColor(.red)
                                }

                            }
                        } else {
                            Text("No address selected")
                        }

                        Button("Search address...") {
                            path.append("AddressSearchView")
                        }
                    }
                    .scaledToFill()


                    Button("Host") {
                        // Verify informations
                        
                        let title = titleInput.trimmingCharacters(in: .whitespaces)
                        let description = descriptionInput.trimmingCharacters(in: .whitespaces)
                        
                        if location != nil && !title.isEmpty && !description.isEmpty {
                            model.createEvent(event:
                                Event(
                                    title: title,
                                    description: description,
                                    dateTime: date,
                                    owner: model.ownerName,
                                    coverImage: model.defaultCoverImageName,
                                    location: location!
                                )
                            )
                            
                            dismiss()
                        }
                    }
                    .buttonStyle(CustomButtonStyle())

                    Spacer()
                }
                .navigationDestination(for: String.self) { view in
                    if view == "AddressSearchView" {
                        AddressSearchView(bLocation: $location)
                    }
                }
            }
  
        }
        .padding()
    }
}

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView()
    }
}

