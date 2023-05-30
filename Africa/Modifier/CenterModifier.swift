//
//  CenterModifier.swift
//  Africa
//
//  Created by Alessandro Sc on 29/05/23.
//

import Foundation
import SwiftUI

struct CenterModifier : ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
