//
//  UserHomeView.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//

import SwiftUI

struct UserHomeView: View {
    
    @EnvironmentObject var model:MuseumModel
    @State var showSetting = false
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack(alignment: .center, spacing: 30.0){
                    HStack{
                        Button {
                            self.showSetting = true
                        } label: {
                            Image(systemName: "gearshape").resizable()
                                .frame(width: 20, height: 20).foregroundColor(.black).padding()
                        }.sheet(isPresented: $showSetting){
                            SettingView()
                        }
                        Spacer()
                    }
                    Text("Home").foregroundColor(.black).bold().font(.largeTitle)
                    //Divider()
                    Spacer()
                        NavigationLink(
                            destination: ArchieveView(),
                            label: {
                                Text("Museums").foregroundColor(.black).bold().font(.title3)
                            })
                    Divider()
                        NavigationLink(
                            destination: FavoritesView(),
                            label: {
                                Text("Favorites").foregroundColor(.black).bold().font(.title3)
                            })
                    Divider()
                        NavigationLink(
                            destination: WishView(),
                            label: {
                                Text("Wish List").foregroundColor(.black).bold().font(.title3)
                            })
                    Spacer()
                    Spacer()
                }.navigationBarTitle("").navigationBarHidden(true)
            }
            }
        }
}

struct UserHomeView_Previews: PreviewProvider {
    static var previews: some View {
        UserHomeView()
    }
}
