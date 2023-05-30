//
//  GalleryView.swift
//  Africa
//
//  Created by Alessandro Sc on 27/05/23.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    
    @State private var selectedAnimal: String = "lion"
    
    let animals : [Animal] = Bundle.main.decode("animals.json")
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    // SIMPLE GRID DEFINITION
  //  let gridLayout: [GridItem] = [
  //      GridItem(.flexible()),
  //      GridItem(.flexible()),
  //      GridItem(.flexible())
  //  ]
    
    // EFFICENT GRID DEFINITION
    //let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DYNAMIC GRID LAYOUT
    
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn : Double = 3.0
    
    // MARK: - FUNCTION
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center,spacing: 30) {
                selectedImage()
                slider()
                // MARK: - GRID
                LazyVGrid(columns: gridLayout, alignment: .center,spacing: 10) {
                    ForEach(animals) { item in
                        gridImage(image: item.image)
                    } //: LOOP
                } //: GRID
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            } //: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical , 70)
        } //: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
        .ignoresSafeArea()
    }
    
    // MARK: - VIEWS
    
    //  SELECTED IMAGE
    func selectedImage() -> some View {
        Image(selectedAnimal)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 8))
    }
    
    //  SLIDER
    func slider() -> some View {
        Slider(value: $gridColumn, in: 2...4, step: 1)
            .padding(.horizontal)
            .onChange(of: gridColumn, perform: { value in
                gridSwitch()
            })
    }
    
    // GRID IMAGE
    func gridImage(image: String) -> some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white,lineWidth: 1))
            .onTapGesture {
                selectedAnimal = image
                haptic.impactOccurred()
            }
    }
    
    
}


// MARK: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
