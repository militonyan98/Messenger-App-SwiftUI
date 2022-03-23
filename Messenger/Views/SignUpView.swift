//
//  SignUpView.swift
//  Messenger
//
//  Created by Hermine M on 20/03/2022.
//

import SwiftUI

struct SignUpView: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var model: AppStateModel
    
    var body: some View {
        VStack {
            // Heading
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)

            // Textfields

            VStack {
                TextField("Email", text: $email)
                    .modifier(CustomField())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                TextField("Username", text: $username)
                    .modifier(CustomField())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $password)
                    .modifier(CustomField())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                Button(
                    action: {
                        self.signUp()
                    },
                    label: {
                        Text("Sign Up")
                            .foregroundColor(Color.white)
                            .frame(width: 220, height: 50)
                            .background(Color.green)
                            .cornerRadius(6)
                    }
                )
            }
            .padding()
            
            Spacer()

        }
        .navigationBarTitle("Create An Account", displayMode: .inline)
    }
    
    func signUp() {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6 else {
            return
        }
        
        model.signUp(email: email, username: username, password: password)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
