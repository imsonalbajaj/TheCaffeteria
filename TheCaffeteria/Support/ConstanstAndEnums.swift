//
//  Constansts.swift
//  TheCaffeteria
//
//  Created by Sonal on 20/11/24.
//

import UIKit

// MARK: constant's

// color's
let color_dark48 = "dark48"
let color_dark96 = "dark96"
let color_dark144 = "dark144"
let color_dark151 = "dark151"
let color_dark216 = "dark216"
let color_dark241 = "dark241"
let color_mb_green_selected_border = "mbGreenSelectedBorder"
let color_mb_green_selected_backGround = "mbGreenSelectedBackground"
let color_primary_red = "primaryRed"
let color_food_primary_green = "foodPrimaryGreen"
let color_rating_yellow = "ratingYellow"

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

let CUSTOM_NAV_HEI = 40.0


// MARK: enum's

enum CustomColor {
    case foodPrimaryGreen
    case ratingYellow
}

enum ApiRespState {
    case loading
    case success(Codable)
    case failure(ErrorTypes)
}
