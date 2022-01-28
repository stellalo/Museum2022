//
//  buttons.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//

import SwiftUI
import Firebase

struct buttons: View {
    
    var museum:Museum
    @EnvironmentObject var viewModel:AppViewModel
    @State var visitIcon = "figure.walk.circle"
    @State var heart = "heart"
    @State var toVisit = "cart.circle"
    
    var body: some View {
        HStack(spacing:60){
                Button(action: {
                    museum.visited.toggle()
                    viewModel.addData(museum: museum,status:"visited",temp:museum.visited)
                    if(museum.visited){
                        visitIcon = "figure.walk.circle.fill"
                    }
                    else{
                        visitIcon = "figure.walk.circle"
                    }
                }, label: {
                    VStack{
                        Image(systemName:visitIcon).resizable()
                                .frame(width: 20, height: 20).foregroundColor(.black)
                        
                        Text("Visited").foregroundColor(.black)
                    }
                })
                Button(action: {
                   // viewModel.getData(museum: museum,status:"favorite")
                    museum.favorite.toggle()
                    viewModel.addData(museum: museum,status:"favorite",temp:museum.favorite)
                    if(museum.favorite){
                        heart = "heart.fill"
                    }
                    else{
                        heart = "heart"
                    }
                }, label: {
                
                    VStack{
                        Image(systemName:heart).resizable()
                            .frame(width: 20, height: 20).foregroundColor(.black)
                        Text("Favorite").foregroundColor(.black)
                    }
                })
                Button(action: {
                    //viewModel.getData(museum: museum,status:"wish")
                    museum.tovisit.toggle()
                    viewModel.addData(museum: museum,status:"wish",temp:museum.tovisit)
                    if (museum.tovisit){
                        toVisit = "cart.circle.fill"
                    }
                    else{
                        toVisit = "cart.circle"
                    }
                }, label: {
                    VStack{
                        Image(systemName: toVisit).resizable()
                            .frame(width: 20, height: 20).foregroundColor(.black)
                        Text("Wish List").foregroundColor(.black)
                    }
                })
        }.onAppear {
            if let currentUser = Auth.auth().currentUser{
                let db = Firestore.firestore()
                let docRef = db.collection("users").document(currentUser.uid).collection("museums").document(museum.Name)
                docRef.getDocument(source: .cache) { document, error in
                    if let document = document{
                        if (document.get("visited") != nil){
                            museum.visited = (document.get("visited"))! as! Bool
                        }
                        if (document.get("favorite") != nil){
                            museum.favorite = (document.get("favorite"))! as! Bool
                        }
                        if (document.get("wish") != nil){
                            museum.tovisit = (document.get("wish"))! as! Bool
                        }
                    }
                }
            }
            if(museum.visited){
                visitIcon = "figure.walk.circle.fill"
            }
            else{
                visitIcon = "figure.walk.circle"
            }
            if(museum.favorite){
                self.heart = "heart.fill"
            }
            else{
                self.heart = "heart"
            }
            if (museum.tovisit){
                self.toVisit = "cart.circle.fill"
            }
            else{
                self.toVisit = "cart.circle"
            }
        }
    
    }
}

struct buttons_Previews: PreviewProvider {
    static var previews: some View {
        let model = MuseumModel()
        buttons(museum: model.museums[0]).environmentObject(AppViewModel())
    }
}
