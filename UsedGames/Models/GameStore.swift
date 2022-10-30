//
//  GameStore.swift
//  UsedGames
//
//  Created by Tuğberk Can Özen on 28.10.2022.
//

import Foundation

final class GameStore: ObservableObject {
    
    @Published var games: [Game] = []
  
    
    // MARK: - Alternative
//    var games: [Game] = [] {
//        didSet {
//            objectWillChange.send()
//        }
//    }
    
    
    // MARK: - Bu şekilde başlatırsak 1 tane oyun ile ekran açılır
//    init() {}
    
    init() {
        for _ in 0..<5 {
            createGame()
        }
    }
    
    @discardableResult func createGame() -> Game {
        let game = Game(random: true)
        games.append(game)
        return game
    }
    
    func delete(at indexSet: IndexSet) {
        games.remove(atOffsets: indexSet)
    }
    
    func move(indicies: IndexSet, to newOffset: Int) {
        games.move(fromOffsets: indicies, toOffset: newOffset)
    }
    
    func indexSet(for game: Game) -> IndexSet? {
        if let firstIndex = games.firstIndex(of: game) {
            return IndexSet(integer: firstIndex)
        } else {
            return nil
        }
    }
    
    func game(at indexSet: IndexSet) -> Game? {
        if let firstIndex = indexSet.first {
            return games[firstIndex]
        }
        
        return nil
    }
    
    func update(game: Game, newWalue: Game) {
        if let index = games.firstIndex(of: game){
            games[index] = newWalue
        }
    }
}
