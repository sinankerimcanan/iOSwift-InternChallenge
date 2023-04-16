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
    
    var body: some View {
        NavigationStack {
            VStack{
                //Slider Bar View
                SliderTabBar(viewModel: viewModel,viewModelCH: viewModelCH)
                Spacer()
                //Character List View
                ListView(viewModelCH: viewModelCH)
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
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(Color.RMpurple)
    }
}
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            AppView()
        }
    }
}




