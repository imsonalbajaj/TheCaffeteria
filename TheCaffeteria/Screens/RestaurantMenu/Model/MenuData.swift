//
//  MenuData.swift
//  TheCaffeteria
//
//  Created by Sonal on 19/11/24.
//

import Foundation

struct MenuData: Codable {
    let section: [Section]?
    let restarantName: String?
    let restarantImg: String?
}

struct Section: Codable, Identifiable {
    let section: String?
    let sectionName: String?
    let values: [MenuItem]?
    
    var id: String { section ?? UUID().uuidString } // Fallback to a unique ID if `section` is nil
}

struct MenuItem: Codable, Identifiable {
    let itemId: String?
    let itemName: String?
    let itemPrice: String?
    let itemReviewsCount: String?
    let itemRating: String?
    let itemDescription: String?
    let itemImage: String?
    
    var id: String { itemId ?? UUID().uuidString } // Fallback to a unique ID if `itemId` is nil
}

