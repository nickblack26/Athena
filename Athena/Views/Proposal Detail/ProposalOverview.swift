import SwiftUI

struct ProposalOverview: View {
    var proposal: PublicSchema.ProposalsSelect
    
    var body: some View {
        Grid(horizontalSpacing: 0, verticalSpacing: 0) {
            GridRow {
                VStack(alignment: .leading) {
                    Section("Customer") {
                        VStack(alignment: .leading) {
                            Divider()
                            Text("Larry McCoy")
                            Text("larry@klydewarrenpark.org")
                            Divider()
                        }
                        .font(.callout)
                    }
                    .headerProminence(.increased)
                    .font(.title2)
                    .fontWeight(.semibold)
                    
                    Section("Expiration date") {
                        if let expirationDate = proposal.expirationDate, 
                            var date = try? Date(expirationDate, strategy: .iso8601) {
                            DatePicker("Expiration Date", selection: Binding(get: { date }, set: { date = $0 }), displayedComponents: .date)
                        }
                    }
                    .headerProminence(.increased)
                    .font(.title2)
                    .fontWeight(.semibold)
                    
                    Section("Description") {
                    }
                    .headerProminence(.increased)
                    .font(.title2)
                    .fontWeight(.semibold)
                    
                    Section("Assumptions") {
                        
                    }
                    .headerProminence(.increased)
                    .font(.title2)
                    .fontWeight(.semibold)
                    
                    Section("Products") {
                        
                    }
                    .headerProminence(.increased)
                    .font(.title2)
                    .fontWeight(.semibold)
                }
                .padding([.top, .trailing, .bottom], 64)
                .padding(.leading, 48)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
                .background(Color.background)
                .gridCellColumns(9)
                
                VStack(alignment: .leading, spacing: 64) {
                    Section("Summary") {
                        
                    }
                    .headerProminence(.increased)
                    .font(.title2)
                    .fontWeight(.semibold)
                }
                .padding([.top, .trailing, .bottom], 64)
                .padding(.leading, 48)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
                .background(.muted.opacity(0.5))
                .gridCellColumns(3)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
}

#Preview {
    @State var supabase = SupabaseManager()

    return ProposalDetail(
        .init(
            createdAt: "",
            expirationDate: "2024-11-17T16:40:51.796495+00",
            id: .init(),
            laborHours: 11,
            laborRate: 250,
            name: "#631492 - Network UPS Renewal",
            status: .building,
            updatedAt: "2024-11-17 16:40:51.796495+00"
        )
    )
    .frame(minWidth: 500, minHeight: 500)
    .environment(supabase)
}
