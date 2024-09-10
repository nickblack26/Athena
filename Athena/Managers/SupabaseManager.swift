import Foundation
import AuthenticationServices
import Supabase
import Observation

@Observable
final class SupabaseManager: NSObject, ObservableObject, ASWebAuthenticationPresentationContextProviding {
    typealias ASPresentationAnchor = NSWindow

    // MARK: - ASWebAuthenticationPresentationContextProviding
    
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
    
    let client = SupabaseClient(
        supabaseURL: URL(string: ProcessInfo.processInfo.environment["SUPABASE_URL"] ?? "")!,
        supabaseKey: ProcessInfo.processInfo.environment["SUPABASE_ANON_KEY"] ?? ""
    )
    
    var user: User?
    
    override init() {
        self.user = client.auth.currentUser
    }
    
    func login() async throws {
        let url = try client.auth.getOAuthSignInURL(provider: .azure, redirectTo: URL(string: "com.hourglass.Athena://"))

        let session = ASWebAuthenticationSession(url: url, callbackURLScheme: "Athena") { url, error in
          guard let url else { return }

          Task {
              try await self.client.auth.session(from: url)
          }
        }

        session.presentationContextProvider = self
        session.prefersEphemeralWebBrowserSession = true
        session.start()
    }
}
