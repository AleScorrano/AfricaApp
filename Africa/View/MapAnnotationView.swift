//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Alessandro Sc on 29/05/23.
//

import SwiftUI

struct MapAnnotationView: View {
    // MARK: - PROPERTIES
    
    @State private var animation: Double = 0.0
    
    var location : NationalParkLocation
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54,height: 54)
            
            Circle()
                .stroke(Color.accentColor,lineWidth: 2)
                .frame(width: 52,height: 52,alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
                
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48,height: 48)
            .clipShape(Circle())
        } //: ZSTACK
        .onAppear{
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1
            }
        }
    }
}

// MARK: - PREVIEW

struct MapAnnotationView_Previews: PreviewProvider {
    static var locations : [NationalParkLocation] = Bundle.main.decode("locations.json")
    static var previews: some View {
        MapAnnotationView(location: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
