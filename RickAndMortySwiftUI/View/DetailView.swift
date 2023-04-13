//
//  DetailView.swift
//  RickAndMortySwiftUI
//
//  Created by Sinan on 12.04.2023.
//

import SwiftUI

struct DetailView: View {
    
    @State var id : String
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Test")
                Text(id)
            }.toolbar{
                ToolbarItem {
                    Image("Rick_and_Morty")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                }
            }
            .frame(width: UIScreen.main.bounds.width*1, height: UIScreen.main.bounds.height*1)
            .background(Color.RMbackground)
        }
        
        //.navigationBarBackButtonHidden(true)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: "")
    }
}
