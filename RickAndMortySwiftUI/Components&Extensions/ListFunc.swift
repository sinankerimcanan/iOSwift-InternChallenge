import Foundation
import SwiftUI
//MARK: Cindiyetine Göre Yanına simge ve çerçeve eklemeye yarayan Func
func getCharacterFrameColor(for gender : String) -> Color {
    switch gender{
    case "Female" : return Color.RMpink
    case "Male" : return Color.RMblue
    case "unknown" : return Color.gray
    default:
        return Color.white
    }
}
func getCharacterGender(for gender : String) -> Image {
    switch gender{
    case "Female" : return Image("FemaleSymbol")
    case "Male" : return Image("MaleSymbol")
    case "unknown" : return Image("wing")
    default:
        return Image("Rick_and_Morty")
    }
}
