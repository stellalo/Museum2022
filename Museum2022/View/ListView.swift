//
//  ListView.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject var model:MuseumModel
    @State var searchText = ""
    
    var body: some View {
            
            NavigationView {
                List{
                    ForEach (results,id:\.self){m in
                        NavigationLink {
                            MuseumDetailView(museum: model.museums[Index[m]!])
                        } label: {
                            HStack{
                                Image(model.museums[Index[m]!].image).resizable().scaledToFill().frame(width: 50, height: 50, alignment:.center).clipped()
                                VStack(alignment: .leading){
                                    Text(m).foregroundColor(.black).font(.body).padding(.bottom,0.0005)
                                    Text(model.museums[Index[m]!].city).font(.caption)
                                }
                            }
                        }

                        
                    }
                }.searchable(text: $searchText)
                    .navigationBarTitle("All Museums")
            }
        }
    
    var NAMES:[String]{
        var names:[String] = []
        for count in 0..<model.museums.count {
            let name = model.museums[count].Name
            names.append(name)
        }
        return names
    }
    var Index:[String:Int]{
        var index = [String:Int]()
        for count in 0..<model.museums.count{
            index[NAMES[count]] = count
        }
        return index
        }

    var results:[String]{
        if searchText.isEmpty{
            return NAMES
        }
        else{
            return NAMES.filter{ $0.contains(searchText)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(MuseumModel())
    }
}

