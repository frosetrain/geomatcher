import SwiftUI

struct Profile: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
    let picture: ImageResource
    let followers: String
    let gender: String
    let orientation: String
    let likes: String
    let dislikes: String
    let bio: String
}

let Profiles = [
    Profile(
        name: "Bolo Gnese",
        age: 50,
        picture: .bolognese,
        followers: "56K",
        gender: "Female",
        orientation: "Straight",
        likes: "My hair",
        dislikes: "Bolognese Pasta",
        bio: "I was the first person to step foot on Planet Bolo, darling!"
    ),
    Profile(
        name: "August",
        age: 17,
        picture: .august,
        followers: "5M",
        gender: "Male",
        orientation: "Unknown",
        likes: "Singapore!",
        dislikes: "Wearing a hat",
        bio: "I am August the Merlion!"
    ),
    Profile(
        name: "Soccer Robot",
        age: 0,
        picture: .fisheye,
        followers: "2",
        gender: "Robot",
        orientation: "Other robots",
        likes: "24 volts",
        dislikes: "Bodensee Adler",
        bio: "Fisheye camera"
    ),
    Profile(
        name: "Clippy",
        age: 1,
        picture: .clippy,
        followers: "402K",
        gender: "Nonbinary",
        orientation: "Microsoft",
        likes: "Being helpful",
        dislikes: "Nothing",
        bio: "It looks like you're writing a letter. Would you like help?"
    ),
    Profile(
        name: "the zombie of mount faber",
        age: 870,
        picture: .zombie,
        followers: "0",
        gender: "Pangender",
        orientation: "Pansexual",
        likes: "Cheese",
        dislikes: "Coagulated milk",
        bio: "Guhherrerjjhhejhhhrrr   I hate Cheese and am lactose intolerant. But I like coagulated Milk"
    ),
    Profile(
        name: "BRAVE",
        age: 4,
        picture: .brave,
        followers: "12K",
        gender: "Nonbinary",
        orientation: "Aromantic",
        likes: "Going beyond",
        dislikes: "Labels",
        bio: "Go Beyond the Label!"
    ),
]
