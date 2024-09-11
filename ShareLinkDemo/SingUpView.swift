import SwiftUI

struct SignUpView: View {
    @State private var nickname: String = ""
    @State private var password: String = ""
    @State private var passwordConfirmation: String = ""

    var body: some View {
        VStack {
            TextField("Nickname", text: $nickname)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.bottom, 10)

            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.bottom, 10)

            SecureField("Confirm Password", text: $passwordConfirmation)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.bottom, 20)

            Button(action: signUp) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding()
    }

    func signUp() {
        guard let url = URL(string: "https://39e4-52-192-225-247.ngrok-free.app/signup") else { return }

        let body: [String: Any] = [
            "nickname": nickname,
            "password": password,
            "password_confirmation": passwordConfirmation
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch {
            print("Failed to serialize JSON: \(error)")
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error occurred: \(error)")
                return
            }

            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("Response JSON: \(json)")
            } catch {
                print("Failed to parse JSON: \(error)")
            }
        }

        task.resume()
    }
}
