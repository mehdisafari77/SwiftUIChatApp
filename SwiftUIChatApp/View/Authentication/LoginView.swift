//
//  LoginView.swift
//  SwiftUIChatApp
//
//  Created by Mehdi MMS on 30/07/2021.
//

import SwiftUI
import ProgressHUD

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showProgressHUD = true
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 12) {
                    HStack { Spacer() }
                    
                    
                    Text("Hello.")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color(.darkGray))

                    Text("Welcome!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.orange)
                    
                    VStack(spacing: 20) {
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color.clear)
                            .cornerRadius(10)
                            .padding(.horizontal, 32)
                        
                        CustomSecureField(placeholder: Text("Password"), text: $password)
                            .padding()
                            .background(Color.clear)
                            .cornerRadius(10)
                            .padding(.horizontal, 32)
                    }
        
                    .padding([.top, .horizontal], 32)
 
                }
                .padding(.leading)
                
                HStack {
                    Spacer()
                    
                    NavigationLink(
                        destination: Text("Reset Password..."),
                        label: {
                            Text("Forgot Password?")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(Color(.darkGray))
                                .padding(.top)
                                .padding(.trailing, 28)
                        })
                }
                
                Button(action: {
                    viewModel.login(withEmail: email, password: password)
                }, label: {
                    Text("Sign in")
                        .font(.headline)
                        .foregroundColor(Color(.darkGray))
                        .frame(width: 340, height: 50)
                        .background(Color.orange)
                        .clipShape(Capsule())
                        .padding()
                })
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
                
                
                Spacer()
                
                Image("logoupmessage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 50)
                    .padding(.horizontal)
                    .padding(.bottom)
                
                NavigationLink(
                    destination: RegistrationView()
                        .navigationBarBackButtonHidden(true),
                    label: {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                                .foregroundColor(Color(.darkGray))
                            
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold)).foregroundColor(.orange)
                        }
                    }).padding(.bottom, 32)
            }
        }
        .padding(.top, -56)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


