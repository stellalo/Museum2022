//
//  LoginView.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//


import SwiftUI
import FirebaseAuth
import Firebase

class AppViewModel:ObservableObject{
    
    let auth = Auth.auth()
    @Published var signedIn = false
    
    var isSignedIn:Bool{
        return auth.currentUser != nil
    }
    
    func SignIn(email:String,password:String){
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil,error == nil else{
                return
            }
            //success --> show another view
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
            
        }
    }
    func SignUp(name:String,email:String,password:String){
        auth.createUser(withEmail: email, password: password) {[weak self]  result, error in
            guard result != nil,error == nil else{
                return
            }
            //success
            DispatchQueue.main.async {
               // self?.saveUser()
                self?.signedIn = true
            }
        }
    }
    func signOut(){
        try? auth.signOut()
        self.signedIn = false
    }
    //func saveUser(){
       // if let currentUser = Auth.auth().currentUser{
         //   let db = Firestore.firestore()
           // db.collection("Users").document(currentUser.uid)
            
        //}
    //}
}

struct LoginView:View{
    @EnvironmentObject var viewModel:AppViewModel
    
    var body:some View{
        NavigationView{
            if viewModel.signedIn{
                MuseumTabView().environmentObject(MuseumModel()).navigationBarTitle("",displayMode: .inline).navigationBarHidden(true)
            }
            else{
                SigninView()
            }
        }.onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
        //.environmentObject(MuseumModel())
    }
}
