import SwiftUI

struct NewCityView: View {
    @State private var search: String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var cityStore: CityStore // Assurez-vous que CityStore est bien défini une seule fois

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter city name", text: $search)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    self.addCity()
                }) {
                    Text("Add City")
                        .padding()
                        .frame(width: 150)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(search.isEmpty)
                .padding()
                
                Spacer()
            }
            .navigationBarTitle("Add City", displayMode: .inline)
            .navigationBarItems(leading: cancelButton)
        }
    }

    private var cancelButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("Cancel")
        }
    }

    private func addCity() {
        let newCity = City(name: search) // Ajout sans validation API
        cityStore.cities.append(newCity) // Ajoute la ville directement
        self.presentationMode.wrappedValue.dismiss() // Ferme la vue
    }
}
