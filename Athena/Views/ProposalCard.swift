import SwiftUI

struct ProposalCard: View {
    @Environment(\.openWindow) private var openWindow

    var proposal: PublicSchema.ProposalsSelect
    
    init(_ proposal: PublicSchema.ProposalsSelect) {
        self.proposal = proposal
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack(alignment: .top) {
                Text(proposal.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Spacer()
                
                HStack {
                    Button("Edit", systemImage: "pencil") {
                        openWindow(value: proposal)
                    }
                    .buttonStyle(.plain)
                    .labelStyle(.titleAndIcon)
                    
                    Divider()
                        .frame(height: 20)
                    
                    Menu {
                        Section {
                            Button("Preview", systemImage: "eye") {}
                            Button("Duplicate", systemImage: "doc.on.doc") {}
                        }
                        
                        Section {
                            Button("Delete", systemImage: "trash", role: .destructive) {}
                                .tint(.red)
                        }
                    } label: {
//                        Button("", systemImage: "") {
//                            
//                        }
//                        .labelStyle(.iconOnly)
                    }
                    .menuStyle(MenuItemStyle())
                    .labelStyle(.titleAndIcon)
                    .labelsHidden()
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(.secondary)
                .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            
            Text(proposal.companyName ?? "")
                .foregroundStyle(.secondary)
            
            HStack {
                Text(proposal.status.rawValue)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 2)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                
                if let date = try? Date(proposal.updatedAt, strategy: .iso8601) {
                    Text(date, format: .dateTime)
                }
            }
        }
        .frame(
            maxWidth: .infinity,
            alignment: .topLeading
        )
        .padding()
        .background(Color.background)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 1)
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    @State var supabaseManager = SupabaseManager()
    return ContentView().environment(supabaseManager).frame(
        minWidth: 1920,
        minHeight: 1080
    )
}
