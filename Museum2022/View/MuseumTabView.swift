//
//  ContentView.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//

import SwiftUI

struct MuseumTabView: View {
    var body: some View {
        TabView{
            BrowseView().tabItem {
                Image(systemName: "book.circle.fill")
                Text("Browse")
            }
            ListView().tabItem {
                Image(systemName: "magnifyingglass.circle.fill")
                Text("Search")
            }
            UserHomeView().tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("Home")
            }
        }
    }
}

struct MuseumTabView_Previews: PreviewProvider {
    static var previews: some View {
        MuseumTabView().environmentObject(MuseumModel())
    }
}
