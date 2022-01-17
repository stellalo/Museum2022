//
//  BrowseView.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//

import SwiftUI

struct BrowseView: View {
    
    @EnvironmentObject var model:MuseumModel
    @State var citySelect = 0
    @State var showDetail = false
    
    let locations = [
        "Amsterdam",
        "Berlin",
        "Montréal",
        "New York",
        "Paris",
        "San Francisco",
        "Taipei"
    ]
    
    var body: some View {
        
        //to adjust the rectangle
        VStack {
            Text("Select city: ")
            Spacer()
                HStack {
                    
                    Picker("City ",selection: $citySelect){
                        ForEach (0..<locations.count){ index in
                            Text((locations[index])).tag(index)
                        }
                    }.pickerStyle(MenuPickerStyle())
                }
                GeometryReader { geo in
                    TabView{
                        //loop through each museums
                        ForEach (0..<model.museums.count, id:\.self){ index in
                            if model.museums[index].city == locations[citySelect] {
                                Button(action:{
                                    //show museum detail sheet
                                    self.showDetail = true
                                },label:{
                                    ZStack{
                                        Rectangle().foregroundColor(.white)
                                        VStack(spacing:0){
                                            Image(model.museums[index].photo[0]).resizable().aspectRatio(contentMode: .fill).clipped()
                                            Text(model.museums[index].Name).padding()
                                        }
                                    }
                                }).tag(index).sheet(isPresented: $showDetail){
                                    NavigationView{
                                        MuseumDetailView(museum: model.museums[index]).navigationBarTitle("").navigationBarHidden(true)
                                    }
                                    //show museum detail view
                                    
                                }.frame(width: geo.size.width-40, height: geo.size.height-100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(15).shadow(radius: 10).shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: -5)
                            }
                        }
                        //create swipable view
                    }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic)).indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)).buttonStyle(PlainButtonStyle())
                }
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView().environmentObject(MuseumModel())
    }
}
