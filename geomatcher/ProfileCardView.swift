//
//  geomatcherApp.swift
//  geomatcher
//
//  Created by T Krobot on 1/8/26.
//

//this is for the individual person's icons/small photos for when you scroll the home page

import SwiftUI

struct ProfileCardView: View {
    let profile: Profile
    var animation: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("bolognese")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(16)
            

            
            VStack(alignment: .leading) {
                Text("\(profile.name), \(profile.age)")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding(12)
            .matchedGeometryEffect(id: "text_\(profile.id)", in: animation)
        }
    }
}
#Preview {
    ProfileCardView(profile: <#T##Profile#>, animation: <#T##Namespace.ID#>)
}





