//
//  WishView.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//

import SwiftUI

struct WishView: View {
    
    @EnvironmentObject var model: MuseumModel
    
    var body: some View {
        VStack {
            Text("Wish List").bold().font(.largeTitle)
            List{
                ForEach (0..<model.museums.count){ index in
                    if(model.museums[index].tovisit == true){
                        NavigationLink(
                            destination: MuseumDetailView(museum:model.museums[index]),
                            label: {
                                HStack{
                                    Image(model.museums[index].image).resizable().scaledToFill().frame(width: 50, height: 50, alignment:.center).clipped()
                                    Text(model.museums[index].Name)
                                }
                            })
                        
                    }
                }
            }
        }.navigationBarTitle("",displayMode:.inline)
    }
}

struct WishView_Previews: PreviewProvider {
    static var previews: some View {
        WishView().environmentObject(MuseumModel())
    }
}
