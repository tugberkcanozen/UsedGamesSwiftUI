//
//  DetailView.swift
//  UsedGames
//
//  Created by Tuğberk Can Özen on 30.10.2022.
//

import SwiftUI
import Combine

struct DetailView: View {
    
    var game: Game
    var gameStore: GameStore
    @State var name: String = ""
    @State var price: Double = 0.0
    @State var shouldEnableSaveButton: Bool = true
    
    func validate() {
        shouldEnableSaveButton = game.name != name || game.priceInDollars != price
    }
    
    var body: some View {
        Form {
            List {
                VStack(alignment: .leading, spacing: 6.0) {
                    Text("Name")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    TextField("Name", text: $name)
                        .padding(.vertical, 4.0)
                        .textFieldStyle(.roundedBorder)
                        .onReceive(Just(name)) { publisher in
                            validate()
                        }
                }
                
                VStack(alignment: .leading, spacing: 6.0) {
                    Text("Price in Dollars")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    TextField("Price", value: $price, formatter: Formatters.dollarFormatter)
                        .padding(.vertical, 4.0)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                }
            }
            Section {
                Button {
                    let newGame = Game(name: name,
                                       priceInDollars: price,
                                       serialNumber: game.serialNumber)
                    gameStore.update(game: game, newWalue: newGame)
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                }
                .disabled(!shouldEnableSaveButton)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let gameStore = GameStore()
        let game = gameStore.createGame()
      
        DetailView(game: game, gameStore: gameStore)
    }
}
