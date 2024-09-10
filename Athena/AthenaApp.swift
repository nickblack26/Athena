import SwiftUI

let radius: CGFloat = 16

@main
struct AthenaApp: App {
    @State private var supabaseManager = SupabaseManager()
    
    var body: some Scene {
        WindowGroup {
            if let _ = supabaseManager.user {
                ContentView()
                    .background(.muted.opacity(0.5))
            } else {
                LoginView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.muted.opacity(0.5))
            }
        }
        .windowStyle(.hiddenTitleBar)
        .environment(supabaseManager)
        
        WindowGroup(for: PublicSchema.ProposalsSelect.self) { proposal in
            if let wrappedProposal = proposal.wrappedValue, let _ = supabaseManager.user  {
                ProposalDetail(wrappedProposal)
                    .background(.muted.opacity(0.5))
            }
        }
        .windowStyle(.hiddenTitleBar)
        .environment(supabaseManager)
    }
}
