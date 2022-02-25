//
//  View+CornerRadius.swift
//  SwiftUiMusic
//
//  Created by Antonio Carabantes Millán on 25/2/22.
//

import Foundation
import SwiftUI



extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
