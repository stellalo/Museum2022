//
//  UserHomeView.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct UserHomeView: View {
    
    @EnvironmentObject var model:MuseumModel
    @EnvironmentObject var viewModel:AppViewModel
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
        }.onAppear {
            for m in model.museums{
                if let currentUser = Auth.auth().currentUser{
                    let db = Firestore.firestore()
                    let docRef = db.collection("users").document(currentUser.uid).collection("museums").document(m.Name)
                    docRef.getDocument(source: .cache) { document, error in
                        if let document = document{
                            if (document.get("visited") != nil){
                                m.visited = (document.get("visited"))! as! Bool
                            }
                            if (document.get("favorite") != nil){
                                m.favorite = (document.get("favorite"))! as! Bool
                            }
                            if (document.get("wish") != nil){
                                m.tovisit = (document.get("wish"))! as! Bool
                            }
                        }
                    }
                }
            }
        }
    }
}

struct UserHomeView_Previews: PreviewProvider {
    static var previews: some View {
        UserHomeView().environmentObject(AppViewModel())
    }
}
