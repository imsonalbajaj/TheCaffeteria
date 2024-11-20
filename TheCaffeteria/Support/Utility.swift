//
//  Utility.swift
//  TheCaffeteria
//
//  Created by Sonal on 19/11/24.
//

import Foundation

class Utility {
    class func loadJSON<T: Decodable>(fromFile fileName: String, withExtension fileExtension: String = "json", in bundle: Bundle = .main) -> T? {
        guard let url = bundle.url(forResource: fileName, withExtension: fileExtension) else {
            print("Unable to find \(fileName).\(fileExtension) file")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Error loading JSON data: \(error)")
            return nil
        }
    }
}
