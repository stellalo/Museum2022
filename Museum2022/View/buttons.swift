//
//  buttons.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//

import SwiftUI

struct buttons: View {
    
    var museum:Museum
    @State var visitIcon = "figure.walk.circle"
    @State var heart = "heart"
    @State var toVisit = "cart.circle"
    
    var body: some View {
        HStack(spacing:60){
                Button(action: {
                    museum.visited.toggle()
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
                    museum.favorite.toggle()
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
                    museum.tovisit.toggle()
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
            if(museum.visited){
                visitIcon = "figure.walk.circle.fill"
            }
            else{
                visitIcon = "figure.walk.circle"
            }
            if(museum.favorite){
                heart = "heart.fill"
            }
            else{
                heart = "heart"
            }
            if (museum.tovisit){
                toVisit = "cart.circle.fill"
            }
            else{
                toVisit = "cart.circle"
            }
        }
    }
}

struct buttons_Previews: PreviewProvider {
    static var previews: some View {
        let model = MuseumModel()
        buttons(museum: model.museums[0])
    }
}
