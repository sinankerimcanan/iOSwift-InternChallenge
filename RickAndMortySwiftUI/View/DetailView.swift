//
//  DetailView.swift
//  RickAndMortySwiftUI
//
//  Created by Sinan on 12.04.2023.
//

import SwiftUI

struct DetailView: View {
    
    
    @StateObject var viewModel = RMDetailViewModel()
    @State var url : String
    @State var epsisodesArray : String?
    
    // 1pt = 2px
    var body: some View {
        NavigationView {
            VStack{
                if let item = viewModel.Character{
                    VStack{
                        Text(item.name)
                            .font(.custom("DynaPuff", size: 35))
                            .padding(.top ,UIScreen.main.bounds.height/11)
                        AsyncImage(url: URL(string: item.image)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 275, height: 275)
                                    .border(Color.black)
                            case .failure:
                                Text("Failed to load image")
                            @unknown default:
                                fatalError()
                            }
                        }
                    }
                    .onAppear{
                    }
                    VStack(alignment: .leading , spacing: 10){
                        textCell(title: "Status:", content: item.status)
                        textCell(title: "Specy:", content: item.species)
                        textCell(title: "Gender:", content: item.gender)
                        textCell(title: "Origin:", content: item.origin.name)
                        textCell(title: "Location:", content: item.location.name)
                        textCell(title: "Episodes:", content: viewModel.generationUrl(urls: item.episode))
                        textCell(title: "Created at \n(in API):", content: item.created)
                    }
                    .padding(.horizontal, 20)
                }
                else {
                    VStack {
                        Image("morty")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width*0.45)
                            .padding(.vertical)
                        Text("This Character \n Cannot Find Info!")
                            .font(.custom("DynaPuff", size: 30))
                            .fontWeight(.light)
                            .foregroundColor(Color.RMpurple)
                            .multilineTextAlignment(.center)
                            .padding(.top,10)
                    }
                    .padding(.top , 35)
                }
                //                Text("Character ID:\(url)")
                //                    .background(Color.red)
                Spacer()
            }
            .onAppear{
                print("Detail View Açıldı")
                viewModel.loadCharacteData(url: url)
            }
            .toolbar{
                ToolbarItem(placement: .navigation) {
                    Image("Rick_and_Morty")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .padding(.top)
            .frame(width: UIScreen.main.bounds.width*1, height: UIScreen.main.bounds.height*1)
            .background(Color.RMbackground)
            
        }
        //.navigationBarBackButtonHidden(true)
        
    }
}

func textCell(title: String , content : String) -> some View{
    return HStack{
        Text(title)
            .font(.custom("Avenir", size: 22))
            .fontWeight(.bold)
            .frame(width: 140 , alignment: .leading)
        
        Text(content)
            .font(.custom("Avenir", size: 22))
            .fontWeight(.regular)
        
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "")
    }
}
