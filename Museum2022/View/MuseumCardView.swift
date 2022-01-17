//
//  MuseumCardView.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//

import SwiftUI

struct MuseumCardView: View {
    
    @EnvironmentObject var model:MuseumModel
    var museum:Museum
    @State var visit = false
    
    var body: some View {
        GeometryReader{ geo in
            VStack {
                //Text(museum.Name).bold().font(.title2).padding(.bottom, 4)
                TabView {
                    ForEach (0..<museum.photo.count){ index in
                            ZStack{
                                Rectangle().foregroundColor(.white).frame(width: geo.size.width-40, height: geo.size.height-190, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(15).shadow(radius: 10).shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: -5)
                                Image(museum.photo[index]).resizable().aspectRatio(contentMode: .fill).clipped().frame(width: geo.size.width-40, height: geo.size.height-190, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(5)
                                }
                        }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic)).indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)).buttonStyle(PlainButtonStyle())
                buttons(museum:museum)
                    .padding(.top)
            }
        }
    }
}

struct MuseumCardView_Previews: PreviewProvider {
    static var previews: some View {
        let model = MuseumModel()
        MuseumCardView(museum: model.museums[0])
    }
}
