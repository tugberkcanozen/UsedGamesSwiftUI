//
//  GameListItem.swift
//  UsedGames
//
//  Created by Tuğberk Can Özen on 28.10.2022.
//

import SwiftUI

struct GameListItem: View {
    
    var game: Game
    var numberFormatter: NumberFormatter = Formatters.dollarFormatter
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(game.name)
                    .font(.body)
                Text(game.serialNumber)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(NSNumber(value: game.priceInDollars), formatter: numberFormatter)
                .font(.title2)
                .foregroundColor(game.priceInDollars > 30 ? .blue : .gray)
        }.padding(.vertical, 8)
    }
}


struct GameListItem_Previews: PreviewProvider {
    static var previews: some View {
        
        let item = GameListItem(game: Game(random: true))
            .padding(.horizontal)
        .previewLayout(.sizeThatFits)
        
        Group {
           item
           item.preferredColorScheme(.dark)
        }
    }
}
