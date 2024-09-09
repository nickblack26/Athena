import SwiftUI

struct ProjectTemplate: Identifiable, Codable, Transferable {
    var id: Int
    var name: String?
    var description: String?
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .data)
    }
}

struct ProposalWorkplan: View {
    @Environment(SupabaseManager.self) private var supabase
    @State private var phases: [PublicSchema.PhasesSelect] = []
    @State private var templates: [ProjectTemplate] = []
    
    var versionId: String
    
    var body: some View {
        Grid {
            GridRow {
                ScrollView {
                    ForEach(templates) { template in
                        Label(template.name ?? "", systemImage: "rectangle.grid.3x2")
                            .draggable(template)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .lineLimit(1)
                    }
                }
                .frame(
                    minWidth: 288,
                    maxWidth: 288,
                    alignment: .topLeading
                )
                
                ScrollView {
                    Section {
                        ForEach(phases.sorted(by: { $0.order < $1.order }), id: \.id) { phase in
                            PhaseListItem(phase)
                                .dropDestination(for: ProjectTemplate.self) { items, location in
                                    guard let index = phases.firstIndex(of: phase) else { return false }
                                    var mutatedPhases: [PublicSchema.PhasesSelect] = phases
                                    
                                    let createdPhases: [PublicSchema.PhasesSelect] = items.map { item in
                                        return PublicSchema.PhasesSelect(description: item.name ?? "", hours: 0, id: .init(), order: Double(index + 1), version: .init())
                                    }
                                    
                                    mutatedPhases.append(contentsOf: createdPhases)
                                    
                                    for i in index..<mutatedPhases.count {
                                        mutatedPhases[i].order += 2
                                    }
                                    
                                    phases = mutatedPhases
                                    return true
                                } isTargeted: { target in
                                    print(target)
                                }

                        }
                        .dropDestination(for: ProjectTemplate.self) { items, index in
                            print(items, index)
                        }
                    } header: {
                        HStack {
                            Text("Workplan")
                                .font(.title)
                            
                            Spacer()
                            
                            Button("Add Phase", systemImage: "plus") {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 32)
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
            }
        }
        .task {
            do {
                self.templates = try await ConnectWiseManager.shared.client.getItem(
                    [ProjectTemplate].self,
                    from: .project(.projectTemplates()),
                    with: .init(conditions: [\.description:""], fields: [\.id])
                )
                
                self.phases = try await supabase.client.from("phases")
                    .select()
                    .eq("version", value: "2427900e-ba6f-445d-89dd-873506e97cb5")
                    .execute()
                    .value
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    @State var supabaseManager = SupabaseManager()
    
    return ProposalWorkplan(versionId: "2427900e-ba6f-445d-89dd-873506e97cb5")
        .environment(supabaseManager)
        .frame(minHeight: 500)
}
