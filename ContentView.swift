//
//  ContentView.swift
//  TicTacToe
//
//  Created by Berke Sarıtaş on 9.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    func winnerContoller(player : Player , moveList : Array<Move?>) -> Void {
        
        winnerPlayer = "\(player)"
            
        if( moveList[0]?.indicator == moveList[1]?.indicator && moveList[1]?.indicator == moveList[2]?.indicator && moveList[0] != nil){
                    isWin = true
            
            }
        
       else if( moveList[3]?.indicator == moveList[4]?.indicator && moveList[4]?.indicator == moveList[5]?.indicator && moveList[3] != nil){
                    isWin = true
            }
       else if( moveList[6]?.indicator == moveList[7]?.indicator && moveList[7]?.indicator == moveList[8]?.indicator && moveList[6] != nil){
                    isWin = true
            }
        else if( moveList[0]?.indicator == moveList[3]?.indicator && moveList[3]?.indicator == moveList[6]?.indicator && moveList[0] != nil){
                     isWin = true
             }
        else if( moveList[1]?.indicator == moveList[4]?.indicator && moveList[4]?.indicator == moveList[7]?.indicator && moveList[1] != nil){
                     isWin = true
             }
        else if( moveList[2]?.indicator == moveList[5]?.indicator && moveList[5]?.indicator == moveList[8]?.indicator && moveList[2] != nil){
                     isWin = true
             }
        else if( moveList[0]?.indicator == moveList[4]?.indicator && moveList[4]?.indicator == moveList[8]?.indicator && moveList[0] != nil){
                     isWin = true
             }
        else if( moveList[2]?.indicator == moveList[4]?.indicator && moveList[4]?.indicator == moveList[6]?.indicator && moveList[2] != nil){
                     isWin = true
             }
        
    }
    
  
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    @State private var moves: [Move?] = Array(repeating: nil, count: 9)
    @State private var isPlayerOne = true
    @State var isWin = false
    @State private var winnerPlayer : String = ""
    
    var body: some View {
        GeometryReader{geometry in
            VStack {
                Spacer()
                
                LazyVGrid(columns: columns, spacing: 5, content: {
                    ForEach(0..<9, content: {i in
                        ZStack{
                            Circle()
                                .foregroundColor(.red).opacity(0.5)
                                .frame(width: geometry.size.width / 3 - 15 , height: geometry.size.height / 5 - 15 , alignment: .center)
                            
                            Image(systemName: moves[i]?.indicator ?? "")
                                .resizable()
                                .frame(width: 49, height: 49, alignment: .center)
                                .foregroundColor(.white)

                            
                             
                        }
                        .onTapGesture {
                            
                            if(isWin == false){
                                moves[i] = Move(player: isPlayerOne ? .playerOne : .playerTwo, boardIndex: i)
                                winnerContoller(player: isPlayerOne ? .playerOne : .playerTwo, moveList: moves)
                                isPlayerOne.toggle()
                            }
                                    
                            
                          
                        }.alert("\(winnerPlayer) is Win !! 🎉🎉", isPresented: $isWin, actions: {
                            
                        })
                    })
                    
                })
                
            Spacer()
            }.padding()
        }
       
    }
}

enum Player {
case playerOne , playerTwo
}

struct Move{
    let player : Player
    let boardIndex : Int
    
    var indicator: String {
        return player == .playerOne ? "xmark" : "circle"
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
