import SwiftUI

let radius: CGFloat = 16

@main
struct AthenaApp: App {
    @State private var supabaseManager = SupabaseManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(.muted)
        }
        .windowStyle(.hiddenTitleBar)
        .environment(supabaseManager)
        
        WindowGroup(for: PublicSchema.ProposalsSelect.self) { proposal in
            if let wrappedProposal = proposal.wrappedValue {
                ProposalDetail(wrappedProposal)
                    .background(.muted)
            }
        }
        .windowStyle(.hiddenTitleBar)
        .environment(supabaseManager)
    }
}
