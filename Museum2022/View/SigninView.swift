//
//  SigninView.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//

import SwiftUI
import FirebaseAuth

struct SigninView: View {
    
    @EnvironmentObject var viewModel:AppViewModel
    @State var email = ""
    @State var password = ""
    @State var userName = ""
    @State var haveAccount = false
    
    var body: some View {
        VStack{
            Spacer()
            Text("Sign In").bold().font(.largeTitle).padding()
            Image("notion-logo").resizable().scaledToFit().frame(width: 150, height: 150)
            Spacer()
            VStack{
                TextField("Email Address",text:$email).disableAutocorrection(true).autocapitalization(.none).padding().background(Color(.secondarySystemBackground))
                SecureField("Password", text: $password).disableAutocorrection(true).autocapitalization(.none).padding().background(Color(.secondarySystemBackground))
            }.padding(.bottom,40).padding(.horizontal)
            Button {
                //action--> navigate to TabView?
                guard !email.isEmpty,!password.isEmpty else{
                    return
                }
                viewModel.SignIn(email: email, password: password)
            } label: {
                Text("Sign In").bold().frame(width: 200, height: 50).background(.black).foregroundColor(.white).cornerRadius(8)
            }
            Button {
                self.haveAccount = true
            } label: {
                Text("Don't have an account yet? Create Account").underline().foregroundColor(.gray).font(.footnote).padding(5)
            }.sheet(isPresented: $haveAccount) {
                //create account view
                VStack{
                    Text("Create Account").bold().font(.largeTitle).padding()
                    Image("notion-logo").resizable().scaledToFit().frame(width: 150, height: 150)
                    VStack{
                        TextField("Name", text: $userName).disableAutocorrection(true).autocapitalization(.none).padding().background(Color(.secondarySystemBackground))
                        TextField("Email Address",text:$email).disableAutocorrection(true).autocapitalization(.none).padding().background(Color(.secondarySystemBackground))
                        SecureField("Password", text: $password).disableAutocorrection(true).autocapitalization(.none).padding().background(Color(.secondarySystemBackground))
                    }.padding(.vertical,35).padding(.horizontal)
                    
                    Button {
                        guard !email.isEmpty,!password.isEmpty else{
                            return
                        }
                        viewModel.SignUp(name: userName, email: email, password: password)
                    } label: {
                        Text("Create Account").bold().frame(width: 200, height: 50).background(.black).foregroundColor(.white).cornerRadius(8)
                    }
                }
            }
            Spacer()
        }
    }
}
struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView().environmentObject(AppViewModel())
    }
}
