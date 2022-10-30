//
//  Game.swift
//  UsedGames
//
//  Created by Tuğberk Can Özen on 28.10.2022.
//

import Foundation

final class Game: NSObject, Identifiable {
    var name: String
    var priceInDollars: Double
    var serialNumber: String
    var dateCreated: Date
    
    init(name: String, priceInDollars: Double, serialNumber: String) {
        self.name = name
        self.priceInDollars = priceInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
    }
    
    // MARK: - Olursa iyi olur init'i
    convenience init(random: Bool = false) {
        if random {
            
            // Rastgele ön ek
            let conditions = ["New", "Mint", "Used"]
            var idx = arc4random_uniform(UInt32(conditions.count))
            let randomCondition = conditions[Int(idx)]
            
            
            
            // Rastgele isim
            let names = ["Resident Evil", "Gears of War", "Halo", "God of War"]
            idx = arc4random_uniform(UInt32(names.count))
            let randomName = names[Int(idx)]
            
            idx = arc4random_uniform(UInt32(6))
            let randomTitle = "\(randomCondition) \(randomName) \(Int(idx))"
            let serialNumber = UUID().uuidString.components(separatedBy: "-").first!
            
            // Rastgele fiyat etiketi
            let priceInDollars = Double(arc4random_uniform(UInt32(70)))
            
            // init'i ver
            self.init(name: randomTitle, priceInDollars: priceInDollars, serialNumber: serialNumber)
            
        } else {
            self.init(name: "", priceInDollars: 0, serialNumber: "")
        }
    }
}
