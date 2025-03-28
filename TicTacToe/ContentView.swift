import SwiftUI

struct ContentView: View {
    @StateObject var gameState = GameState()
    
    var body: some View {
        let borderSize = CGFloat(5)
        
        VStack {
            Text(gameState.turnText())
                .font(.title)
                .bold()
                .padding()
            
            Text(String(format: "Crosses: %d", gameState.crossesScore))
                .font(.title)
                .bold()
                .padding()
            
            VStack(spacing: borderSize) {
                ForEach(0...2, id: \.self) { row in
                    HStack(spacing: borderSize) {
                        ForEach(0...2, id: \.self) { column in
                            let cell = gameState.board[row][column]
                            
                            Text(cell.displayTile())
                                .font(.system(size: 60))
                                .foregroundColor(cell.tileColor())
                                .bold()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .aspectRatio(1, contentMode: .fit)
                                .background(Color.white)
                                .onTapGesture {
                                    gameState.placeTile(row, column)
                                }
                        }
                    }
                }
            }
            .background(Color.black)
            .padding()
            
            Text(String(format: "Noughts: %d", gameState.noughtsScore))
                .font(.title)
                .bold()
                .padding()
        }
        .alert(isPresented: $gameState.showAlert) {
            Alert(
                title: Text(gameState.alertMessage),
                dismissButton: .default(Text("Play Again")) {
                    gameState.resetBoard()
                }
            )
        }
    }
}
