import SwiftUI

struct LoginView: View {
    @Environment(SupabaseManager.self) private var supabase
    
    @State private var email: String = ""
    
    var body: some View {
        VStack {
            Image(.veloLogo)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Form {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Login")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("Enter your email below to login to your account.")
                    }
                    .padding(24)
                    
                    VStack(alignment: .leading) {
                        Text("Email\(Text("*").foregroundStyle(.red))")
                        TextField(
                            "Email",
                            text: $email,
                            prompt: Text("m@example.com")
                        )
                        .textFieldStyle(Input())
                        .labelsHidden()
                    }
                    .padding([.horizontal, .bottom], 24)
                    
                    Button {
                        Task {
                            do {
                                try await supabase.login()
                            } catch {
                                print(error)
                            }
                        }
                    } label: {
                        HStack {
                            Image(.microsoftLogo)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 12, height: 12)
                            
                            Text("Login With Microsoft")
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(OutlineButtonStyle())
                    .padding([.horizontal, .bottom], 24)
                }
            }
            .frame(maxWidth: 363)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.card)
                    .stroke(.card, lineWidth: 1)
            }
        }
    }
    
    func login() {
        
    }
}

#Preview {
    LoginView()
        .frame(minWidth: 500, minHeight: 500)
        .background(.muted.opacity(0.5))
}
