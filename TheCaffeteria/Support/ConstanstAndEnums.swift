//
//  Constansts.swift
//  TheCaffeteria
//
//  Created by Sonal on 20/11/24.
//

import UIKit

// MARK: constant's

let TOP_INSET: CGFloat = UIApplication.shared.connectedScenes
    .compactMap { $0 as? UIWindowScene }
    .flatMap { $0.windows }
    .first { $0.isKeyWindow }?
    .safeAreaInsets.top ?? 0

let BOTTOM_INSET: CGFloat = UIApplication.shared.connectedScenes
    .compactMap { $0 as? UIWindowScene }
    .first?
    .keyWindow?
    .safeAreaInsets.bottom ?? 0

let HEIGHT: CGFloat = UIScreen.main.bounds.height
let WIDTH: CGFloat = UIScreen.main.bounds.width



// MARK: enum's

enum CustomColor {
    case dark48
    case dark96
    case dark144
    case dark151
    case dark216
    case dark241
    case mbGreenSelectedBorder
    case mbGreenSelectedBackGround
    case primaryRed
    case foodPrimaryGreen
    case ratingYellow
}
