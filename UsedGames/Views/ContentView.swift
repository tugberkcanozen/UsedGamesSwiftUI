//
//  ContentView.swift
//  UsedGames
//
//  Created by Tuğberk Can Özen on 28.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var gameStore = GameStore()
    @State var gameToDelete: Game?
    
    var body: some View {
        
        let list = List {
            ForEach(gameStore.games) { game in
                NavigationLink {
                    DetailView(game: game,
                               gameStore: gameStore,
                               name: game.name,
                               price: game.priceInDollars
                    )
                } label: {
                    GameListItem(game: game)
                }
            }
            .onDelete { indexSet in
                //                gameStore.delete(at: indexSet)
                self.gameToDelete = gameStore.game(at: indexSet)
            }
            .onMove { indicies, newOffset in
                gameStore.move(indicies: indicies, to: newOffset)
            }
        }.listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Used Games")
        .navigationBarItems(leading: EditButton(),
                                    trailing: Button { gameStore.createGame() }
                                    label: {
                                    Text("Add") })
            .animation(.linear)
           .actionSheet(item: $gameToDelete) { game ->  ActionSheet in
                
                ActionSheet(title: Text("are you sure?"),
                            message: Text("You will delete\(game.name)"),
                            buttons: [.cancel(), .destructive(Text("Delete"),
                                                              action: {
                    if let indexSet = gameStore.indexSet(for: game) { gameStore.delete(at: indexSet)} })])
            }
        
        if #available(iOS 16.0, *) {
            NavigationStack {
                list
            }
            .accentColor(.purple)
        } else {
            NavigationView {
                list
            }
            .accentColor(.purple)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
