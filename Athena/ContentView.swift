import SwiftUI

struct ContentView: View {
    @Environment(SupabaseManager.self) private var supabase

    @State private var searchText: String = ""
    @State private var proposals: [PublicSchema.ProposalsSelect] = []
    
    var body: some View {
        var filteredFilters: [PublicSchema.ProposalsSelect] {
            if(searchText.isEmpty) {
                return proposals
            } else {
                return proposals.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            }
        }
        
        ScrollView {
            LazyVGrid(columns: .init(repeating: GridItem(), count: 3)) {
                ForEach(filteredFilters, id: \.id) { proposal in
                    ProposalCard(proposal)
                }
            }
        }
        .searchable(text: $searchText)
        .padding()
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .task {
            do {
                var base = supabase.client.from("proposals").select()
                base = base.fullTextSearch("name", query: "")
                self.proposals = try await supabase.client
                    .from("proposals")
                    .select()
                    .execute()
                    .value
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    @Previewable @State var supabaseManager = SupabaseManager()
    return ContentView().environment(supabaseManager).frame(
        minWidth: 1920,
        minHeight: 1080
    )
}
