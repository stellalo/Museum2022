//
//  SettingView.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//

import SwiftUI

struct SettingView: View {
    
    @EnvironmentObject var viewModel:AppViewModel
    
    var body: some View {
        
        Button {
            viewModel.signOut()
            //SigninView()
        } label: {
            Text("Sign Out")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
