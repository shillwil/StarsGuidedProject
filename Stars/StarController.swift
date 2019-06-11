//
//  StarController.swift
//  Stars
//
//  Created by Alex Shillingford on 6/11/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

class StarController {
    private(set) var stars: [Star] = []
    
    private var persistenFileURL: URL? {
        let fileManager = FileManager.default
        
        // Creates "/Users/shillwil/Documents" - documents directory path
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            else {
                return nil
        }
        
        // Creates "/Users/shillwil/Documents/stars.plist" - full file path
        return documents.appendingPathComponent("stars.plist")
    }
    
    init() {
        loadFromPersistentStore()
    }
    
    func addStar(named name: String, withDistance distance: Double) {
        let star = Star(name: name, distance: distance)
        stars.append(star)
    }
    
    func saveToPersistentStore() {
        guard let url = persistenFileURL else { return }
        // whenever you option click on a method like '.encode()' anything that "throws" an error you need to 'try' in a do block, and have a 'catch' block readied up in case an error is thrown
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url)
        } catch {
            print("Error saving stars data: \(error)")
        }
        
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistenFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            stars = try decoder.decode([Star].self, from: data)
        } catch {
            print("Error loading stars data: \(error)")
        }
    }
}
