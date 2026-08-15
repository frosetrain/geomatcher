import SwiftUI

struct Profile: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
    let picture: ImageResource
    let followers: String
    let bio: String
}

let Profiles = [
    Profile(name: "Bolo Gnese", age: 50, picture: .bolognese, followers: "56K", bio: "I hate Cheese and am lactose intolerant. But I like coagulated Milk"),
    Profile(name: "August", age: 17, picture: .august, followers: "5M", bio: "I am August the Merlion!"),
    Profile(name: "Soccer robot", age: 0, picture: .fisheye, followers: "2", bio: "Fisheye camera"),
    Profile(name: "MNC", age: 1, picture: .mnc, followers: "1K", bio: "Magnetic Newton's Cradle: 十分报告")
]
