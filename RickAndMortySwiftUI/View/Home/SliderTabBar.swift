import SwiftUI

struct SliderTabBar: View {
    @StateObject var viewModel = RMSliderTabBarViewModel()
    @StateObject var viewModelCH = RMListViewModel()
    @State var selectedItemID : Int = 1
    
    var body: some View {
        ScrollViewReader { value in
            ScrollView(.horizontal , showsIndicators: false) {
                HStack{
                    ForEach(viewModel.Location?.results ?? [], id: \.id) { result in
                        let isSelected = result.id == selectedItemID
                        Group {
                            Text(result.name)
                                .font(.custom("DynaPuff", size: 16))
                            
                                .onTapGesture {
                                    print(result.id)//View Tab id
                                    // aynı yere tıklanıyorsa verileri tekrar çekme
                                    withAnimation {
                                        value.scrollTo(result.id, anchor: .center)
                                    }
                                    //aynı sekmeyi tıklandığında veri indirimini engelliyor
                                    if selectedItemID != result.id{
                                        viewModelCH.generationUrl(urls: result.residents)
                                    }
                                    selectedItemID = result.id
                                }
                                .onAppear{
                                    //Eger view tekrar açıldığında sectiğim sekme ve id aynı ise verileri yüklüyor
                                    if isSelected{
                                        viewModelCH.generationUrl(urls: result.residents)
                                    }
                                }
                        }
                        .foregroundColor(isSelected ? Color.RMpurple.opacity(1) : Color.RMpurple.opacity(0.5))
                        .frame(height: 40.0)
                        .padding(.horizontal)
                        .background(isSelected ? Color.RMshirtYellow.opacity(1): Color.RMblue.opacity(0.4))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(Color.RMpink, lineWidth: 1.2)
                        )
                    }
                }
            }
            .padding(.top)
        }
    }
}
struct SliderTabBar_Previews: PreviewProvider {
    static var previews: some View {
        SliderTabBar()
    }
}
