//
//  Item.swift
//  TheCaffeteria
//
//  Created by Sonal on 08/08/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
