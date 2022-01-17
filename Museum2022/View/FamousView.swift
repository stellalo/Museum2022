//
//  FamousView.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//

import SwiftUI
struct FamousView: View {
    
    var museum:Museum
    
    var body: some View {
        GeometryReader{ geo in
            VStack {
                Text(museum.Name + ":").bold()
                
                Spacer()
                ScrollView {
                    VStack {
                        Text("About: ").bold().padding(.vertical)
                        Text(museum.introduction).font(.footnote).padding(.horizontal)
                        Text("Famous Collections: ").bold().padding(.vertical)
                        ForEach (0..<museum.famous.count) { index in
                            Image(museum.famous[index].pic ?? "").resizable().scaledToFit().frame(width: geo.size.width, height: geo.size.width, alignment: .center).shadow(radius: 10).shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: -5)
                            HStack {
                                Text(museum.famous[index].name ?? "").padding(.bottom,0.2)
                                Text(museum.famous[index].artist ?? "").padding(.bottom,0.2)
                            }
                            HStack{
                                Text(museum.famous[index].date2 ?? "").font(.footnote)
                                //Text("|")
                                Text(museum.famous[index].material ?? "").font(.footnote)
                               //Text("|")
                                Text(museum.famous[index].location ?? "").font(.footnote)
                            }
                        }
                       // Text("This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.").font(.footnote)
                    }
                }
                Spacer()
            }
        }
        
    }
}

struct FamousView_Previews: PreviewProvider {
    static var previews: some View {
        let model = MuseumModel()
        FamousView(museum:model.museums[30])
    }
}
