//
//  RoundedCorner.swift
//  SwiftUiMusic
//
//  Created by Antonio Carabantes Millán on 25/2/22.
//

import Foundation
import SwiftUI


struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
