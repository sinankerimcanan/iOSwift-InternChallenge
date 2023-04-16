import SwiftUI

struct DetailView: View {@StateObject var viewModel = RMDetailViewModel()
    @State var url : String
    @State var epsisodesArray : String?
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    // 1pt = 2px
    var body: some View {
        NavigationView {
            //Bu kısım kod okunabilriliği açısından daha güzel düzenlenebilir.
            if verticalSizeClass == .compact{
                //Eger Ekran yana dönmüşse gösterilecek Karakter Detay View ı
                HStack{
                    if let item = viewModel.Character{
                        VStack{
                            Text(item.name)
                                .font(.custom("Avenir", size: 35))
                                .fontWeight(.bold)
                                .padding(.top,10)
                                .multilineTextAlignment(.center)
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
                            .padding(.horizontal, 50)
                            
                        }
                        .onAppear{
                        }
                        ScrollView(.vertical , showsIndicators: false) {
                            VStack(alignment: .leading , spacing: 10){
                                textCell(title: "Status:", content: item.status)
                                textCell(title: "Specy:", content: item.species)
                                textCell(title: "Gender:", content: item.gender)
                                textCell(title: "Origin:", content: item.origin.name)
                                textCell(title: "Location:", content: item.location.name)
                                textCell(title: "Episodes:", content: viewModel.generationUrl(urls: item.episode))
                                textCell(title: "Created at \n(in API):", content: item.created)
                                    .padding(.bottom , 20)
                            }
                            .padding(.horizontal, 20)
                        }
                        Spacer()
                        
                    }
                    else {
                        //Api herhangi bir sıkıntı olursa gösterilcek ekran
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
                        
                    }
                }
                .onAppear{
                    print("Detail View Açıldı")
                    viewModel.loadCharacteData(url: url)
                }
                .padding(.top)
                .frame(width: UIScreen.main.bounds.width*1, height: UIScreen.main.bounds.height*1)
                .background(Color.RMbackground)
            }else{
                //Eger Ekran Dik konumda ise gösterilecek Karakter Detay View ı
                VStack{
                    if let item = viewModel.Character{
                        VStack{
                            Text(item.name)
                                .font(.custom("Avenir", size: 35))
                                .fontWeight(.bold)
                                .padding(.top,35)
                                .multilineTextAlignment(.center)
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
                            .padding(.horizontal, 50)
                            .padding(.vertical , 20)
                        }
                        .onAppear{
                        }
                        ScrollView(.vertical , showsIndicators: false) {
                            VStack(alignment: .leading , spacing: 10){
                                textCell(title: "Status:", content: item.status)
                                textCell(title: "Specy:", content: item.species)
                                textCell(title: "Gender:", content: item.gender)
                                textCell(title: "Origin:", content: item.origin.name)
                                textCell(title: "Location:", content: item.location.name)
                                textCell(title: "Episodes:", content: viewModel.generationUrl(urls: item.episode))
                                textCell(title: "Created at \n(in API):", content: item.created)
                                    .padding(.bottom , 20)
                            }
                            .padding(.horizontal, 20)
                        }
                        Spacer()
                        
                    }
                    else {
                        //Api herhangi bir sıkıntı olursa gösterilcek ekran
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
                        
                    }
                }
                .onAppear{
                    print("Detail View Açıldı")
                    viewModel.loadCharacteData(url: url)
                }
                .padding(.top)
                .frame(width: UIScreen.main.bounds.width*1, height: UIScreen.main.bounds.height*1)
                .background(Color.RMbackground)
            }
            
            
        }
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

