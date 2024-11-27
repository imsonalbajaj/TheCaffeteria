//
//  ContentView.swift
//  TheCaffeteria
//
//  Created by Sonal on 08/08/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
    
    @State var text: String = ""

    var body: some View {
        NavigationSplitView {
            MainTabView()
        } detail: {
            Text("Select an item")
        }
    }
}

//#Preview {
//    ContentView()
////        .modelContainer(for: Item.self, inMemory: true)
//}
