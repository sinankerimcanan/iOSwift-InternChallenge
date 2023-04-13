//
//  TabBarView.swift
//  RickAndMortySwiftUI
//
//  Created by Sinan on 9.04.2023.
//

//import SwiftUI
//
//struct TabBarView: View {
//    
//    @StateObject var viewModel = RMLocationViewModel()
//    @StateObject var viewModel2 = RMCharactersViewModel(urls: <#T##[String]#>)
//    @State private var isTapped = false
//    @State var selectedItemID : Int = 1 //ID
//    @ObservedObject var sharedData = SharedData()
//    
//    var body: some View {
//        ScrollView(.horizontal , showsIndicators: false) {
//            HStack{
//                ForEach(viewModel.results ?? [], id: \.id) { result in
//                    let isSelected = result.id == selectedItemID
//                    Group {
//                        Text(result.name)
//                            .font(.headline)
//                            .onTapGesture {
//                                selectedItemID = result.id
//                                print(result.id)//View Tab id
//                                sharedData.residentsArray = result.residents
//                                print("id li data \(sharedData.residentsArray)")
//                                
//
//                            }
//                        
//                    }
//                    .frame(height: 40.0)
//                    .padding(.horizontal)
//                    .background(isSelected ? .gray: .gray.opacity(0.25))
//                    .cornerRadius(20)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 20)
//                            .strokeBorder(.black, lineWidth: 2)
//                    )
//                }
//                
//            }
//        }
//    }
//}
//
//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView()
//    }
//}
