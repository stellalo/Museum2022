//
//  ArchieveView.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//

import SwiftUI

struct ArchieveView: View {
    
    @EnvironmentObject var model:MuseumModel
    //@Binding var visit:Bool
    
    var body: some View {
            VStack {
                Text("Museums").bold().font(.largeTitle)
                List{
                        ForEach (0..<model.museums.count){ index in
                            if(model.museums[index].visited == true){
                                NavigationLink(
                                    destination: MuseumDetailView(museum: model.museums[index]),
                                    label: {
                                        HStack{
                                            Image(model.museums[index].image).resizable().scaledToFill().frame(width: 50, height: 50, alignment:.center).clipped()
                                            Text(model.museums[index].Name)
                                        }
                                    })
                            }
                        }
                }
            }
    }
}


struct ArchieveView_Previews: PreviewProvider {
    static var previews: some View {
        ArchieveView().environmentObject(MuseumModel())
    }
}
