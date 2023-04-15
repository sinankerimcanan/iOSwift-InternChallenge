//
//  AppView.swift
//  RickAndMortySwiftUI
//
//  Created by Sinan on 7.04.2023.
//

import SwiftUI

struct AppView: View{
    @StateObject var viewModel = RMSliderTabBarViewModel()
    @StateObject var viewModelCH = RMListViewModel()
    @State var selectedItemID : Int = 1 //ID
    
    var body: some View {
        NavigationView {
            VStack{
                //Slider Bar View
                SliderTabBar(viewModel: viewModel,viewModelCH: viewModelCH,selectedItemID: selectedItemID)
                Spacer()
                //Character List View
                ListView(viewModelCH: viewModelCH,selectedItemID: selectedItemID)
            }
            .toolbar{
                ToolbarItem {
                    Image("Rick_and_Morty")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                }
            }
            .background(Color.RMbackground)
        }
        
        .accentColor(Color.RMgreen)
    }
}
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
        
    }
}




