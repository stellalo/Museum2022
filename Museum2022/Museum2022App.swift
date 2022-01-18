//
//  Museum2022App.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//

import SwiftUI
import Firebase

@main
struct Museum2022App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            //first screen you see
            let viewModel = AppViewModel()
            LoginView().environmentObject(viewModel)
            
            //MuseumTabView()
              //  .environmentObject(MuseumModel())
        }
    }
}
class AppDelegate:NSObject,UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
