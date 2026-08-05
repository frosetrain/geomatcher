import SwiftUI
import SwiftData

struct Profile: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
    let picture: ImageResource
    let bio: String
}

let ExampleProfiles = [
    Profile(name: "Bolo Gnese", age: 50, picture: .bolognese, bio: "I hate Cheese and am lactose intolerant. But I like coagulated Milk")
]
