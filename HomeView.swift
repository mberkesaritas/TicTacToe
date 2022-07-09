//
//  HomeView.swift
//  TicTacToe
//
//  Created by Berke Sarıtaş on 9.07.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            NavigationLink("Play", destination: ContentView())
            .frame(width: 200, height: 40, alignment: .center)
            .background(.red).opacity(1)
            .cornerRadius(20)
            .foregroundColor(.white).opacity(1)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
