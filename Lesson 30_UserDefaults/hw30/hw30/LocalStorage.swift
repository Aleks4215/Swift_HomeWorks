//
//  LocalStorage.swift
//  hw30
//
//  Created by Алексей on 3.10.24.
//

import Foundation

class LocalStorage: GameStorage {
    private let defaults = UserDefaults.standard
    private let key = "gamekey"
    
    private func savedGame() -> Game? {
        guard let data = defaults.data(forKey: key) else {
            print("No data found in UserDefaults for key \(key)")
            return nil
        }
        let decoder = JSONDecoder()
        guard let game = try? decoder.decode(Game.self, from: data) else {
            print("Failed to decode Game object from data")
            return nil
        }
        print("Game successfully loaded: Level - \(game.level), Score - \(game.score)")
        return game
    }
    
    func save(game: Game) {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(game) else {
            print("Failed to encode Game object")
            return
        }
        defaults.set(data, forKey: key)
        print("Game successfully saved: Level - \(game.level), Score - \(game.score)")
    }
    
    func preparedGame() -> Game? {
        return savedGame()
    }
}
