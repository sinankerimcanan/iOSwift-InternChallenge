//
//  SplashView.swift
//  RickAndMortySwiftUI
//
//  Created by Sinan on 12.04.2023.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var isFirst = UserDefaults.standard.bool(forKey: "splash")
     
    
    
    var body: some View {
        if isActive{
            AppView()
        }else {
            
            NavigationView{
                VStack{
                    VStack{
                        Image("splash")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width*0.6)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                    if isFirst{
                        Text("Hello!")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color.RMpurple)
                    }else{
                        Text("Welcome!")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color.RMpurple)
                    } 
                }
                .frame(width: UIScreen.main.bounds.width*1, height: UIScreen.main.bounds.height*1)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                        self.isActive = true
                        UserDefaults.standard.set(true, forKey: "splash")
                        
                    }
                    
                }
                
                .background(Color.RMbackground)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
