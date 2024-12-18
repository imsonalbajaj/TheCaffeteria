//
//  Extensions.swift
//  TheCaffeteria
//
//  Created by Sonal on 20/11/24.
//

import SwiftUI

extension String {
    func getTruncateStr(with length:Int) -> String{
        if self.count <= length {
            return self
        }
        return self.prefix(length) + ".."
    }
}

extension Color {
    static func getColor(color: CustomColor) -> Color {
        switch color {
        case .foodPrimaryGreen:
            return Color(red: 66 / 255, green: 134 / 255, blue: 18 / 255)
            
        case .ratingYellow:
            return Color(red: 254 / 255, green: 236 / 255, blue: 55 / 255)
        }
        // pallette green - rgb(155, 184, 153)
    }
}


struct VLine: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        }
    }
}

struct HLine: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        }
    }
}

struct RoundedCornerShape: Shape {
    var corners: UIRectCorner
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

