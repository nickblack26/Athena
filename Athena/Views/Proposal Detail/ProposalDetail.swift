import SwiftUI

struct ProposalDetail: View {
    @State private var selectedTab: Tab = .overview
    
    var proposal: PublicSchema.ProposalsSelect
    
    init(_ proposal: PublicSchema.ProposalsSelect) {
        self.proposal = proposal
        print(proposal)
    }
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case .overview:
                ProposalOverview(proposal: proposal)
            case .workplan:
                ProposalWorkplan(versionId: proposal.workingVersion?.uuidString ?? "")
            case .products:
                Text("Products")
            case .settings:
                Text("Settings")
            }
        }
        .navigationTitle(proposal.name)
        .toolbar {
            ToolbarItemGroup(placement: .navigation) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    NavigationalTabItem(selectedTab: $selectedTab, tab: tab)
                }
            }
            
            ToolbarItemGroup(placement: .principal) {
                Button("Testing") {
                    
                }
            }
            
            ToolbarItemGroup(placement: .confirmationAction) {
                Button("K") {
                    
                }
                .padding(6)
                .foregroundStyle(.white)
                .buttonStyle(.plain)
                .background(.blue)
                .clipShape(Circle())
                
                Button("J") {
                    
                }
                .padding(6)
                .foregroundStyle(.white)
                .buttonStyle(.plain)
                .background(.red)
                .clipShape(Circle())
                
                Button("F") {
                    
                }
                .padding(6)
                .foregroundStyle(.white)
                .buttonStyle(.plain)
                .background(.purple)
                .clipShape(Circle())
                
                Button("Share") {}
                    .buttonStyle(.plain)
                
//                Menu("Options", systemImage: "ellipsis") {
//                    
//                }
//                .menuStyle(MenuItemStyle())
//                
//                Menu("NB") {
//                    
//                }
//                .buttonStyle(.borderlessButton)
//                .clipShape(Circle())
            }
        }
    }
}

extension ProposalDetail {
    enum Tab: String, CaseIterable {
        case overview, workplan, products, settings
        
        var icon: String {
            switch self {
            case .overview:
                "list.bullet.clipboard"
            case .workplan:
                "checklist"
            case .products:
                "shippingbox"
            case .settings:
                "gearshape"
            }
        }
        
        var view: any View {
            switch self {
            case .overview:
                return EmptyView()
            case .workplan:
                return EmptyView()
            case .products:
                return EmptyView()
            case .settings:
                return EmptyView()
            }
        }
    }
}

#Preview {
    @State var supabase = SupabaseManager()
    return ProposalDetail(
        .init(
            createdAt: "2024-08-28T14:02:29.768448+00:00",
            expirationDate: "2024-08-28T14:02:29.768448+00:00",
            id: .init(),
            laborHours: 1,
            laborRate: 1,
            name: "",
            status: .building,
            updatedAt: "2024-08-28T14:02:29.768448+00:00"
        )
    )
    .environment(supabase)
    .presentedWindowToolbarStyle(.unifiedCompact)
    .presentedWindowStyle(.hiddenTitleBar)
    .frame(minWidth: 960, minHeight: 540)
}

struct NavigationalTabItem: View {
    @State private var isHovering: Bool = false
    
    @Binding var selectedTab: ProposalDetail.Tab
    var tab: ProposalDetail.Tab
    
    var body: some View {
        let isSelected = selectedTab == tab
        Button {
            selectedTab = tab
        } label: {
            VStack {
                Image(systemName: tab.icon)
                    .imageScale(.small)
                
                Text(tab.rawValue.capitalized)
            }
        }
        .buttonStyle(.plain)
        .padding(.vertical, 4)
        .padding(.horizontal, 8)
        .background(isSelected || isHovering ? .muted : .clear)
        .foregroundStyle(isSelected ? .accent : .primary)
        .clipShape(RoundedRectangle(cornerRadius: 6))
        .onHover { isHovering = $0 }
        .padding(.top, 4)
    }
}
