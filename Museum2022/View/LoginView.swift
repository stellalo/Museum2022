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
    
    @EnvironmentObject var model:MuseumModel
    
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
                self?.saveUser(name:name)
                self?.signedIn = true
            }
        }
    }
    func signOut(){
        try? auth.signOut()
        self.signedIn = false
    }
    func saveUser(name:String){
        if let currentUser = Auth.auth().currentUser{
            let db = Firestore.firestore()
            let path = db.collection("users").document(currentUser.uid)
            path.collection("museums")
            //path.setData(["name":name], merge: true)
        }
    }
    func addData(museum:Museum,status:String,temp:Bool){
        if let currentUser = Auth.auth().currentUser{
            let db = Firestore.firestore()
            let path = db.collection("users").document(currentUser.uid).collection("museums").document(museum.Name)
            path.setData([status:temp],merge: true)
        }
    }
    func getData(museum:Museum){
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
    }
}

struct LoginView:View{
    @EnvironmentObject var viewModel:AppViewModel
    @EnvironmentObject var model:MuseumModel
    
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
        LoginView().environmentObject(AppViewModel()).environmentObject(MuseumModel())
    }
}
