//
//  MuseumDetailView.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//

import SwiftUI

struct MuseumDetailView: View {
    
    var museum:Museum
    
    var body: some View {
            VStack {
                VStack (spacing: 0) {
                    Text(museum.Name).bold().font(.title2).padding(.bottom,4).padding(.top,60)
                    Divider()
                    Text(museum.date + " • directed by" + " " + museum.director).font(.footnote).padding(.top,5)
                    Text(museum.address).font(.footnote).padding(.bottom,5)
                   Divider()
                    NavigationLink{
                        FamousView(museum:museum)
                    } label: {
                        Text("See Collection").font(.headline).foregroundColor(.black).padding(.bottom,5).padding(.top,2)
                    }
                }.navigationBarTitle("", displayMode: .inline)
                MuseumCardView(museum:museum).padding(.bottom)
            }//.ignoresSafeArea()
    }
}

struct MuseumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //create a dummy museum and pass it into the detail so that we can see a preview
        let model = MuseumModel()
        MuseumDetailView(museum: model.museums[0])
    }
}
