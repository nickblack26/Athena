import SwiftUI

struct PhaseListItem: View {
    enum FocusedField {
           case description, hours
       }
    @State private var isExpanded: Bool = false
    @State private var description: String = ""
    @State private var isFocused: Bool = false
    @FocusState private var focusedField: FocusedField?

    
    var phase: PublicSchema.PhasesSelect
    
    init(_ phase: PublicSchema.PhasesSelect) {
        self.phase = phase
        self._description = State(initialValue: phase.description)
    }
    
    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            
        } label: {
            HStack {
                TextField(
                    "Phase Name",
                    text: $description
                )
                .focused($focusedField, equals: .description)
                .textFieldStyle(Input(isFocused: focusedField == .description))
                
                Spacer()
                
                Text("\(Text(phase.hours, format: .number.precision(.fractionLength(2))))hrs")
                
                Menu("Options", systemImage: "ellipsis") {
                    Button(
                        "Delete",
                        systemImage: "trash",
                        role: .destructive
                    ) {
                        
                    }
                    .labelStyle(.titleAndIcon)
                    
                }
                .menuStyle(MenuItemStyle())
                .labelStyle(.iconOnly)
            }
            
        }
        .disclosureGroupStyle(PhaseListItemStyle())
    }
}

#Preview {
    PhaseListItem(.init(
            description: "Testing",
            hours: 0,
            id: .init(),
            order: 1,
            version: .init()
        )
    )
    .frame(minWidth: 500, minHeight: 500)
    .background()
}

struct MenuItemStyle: MenuStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button("Toggle Menu", systemImage: "ellipsis") {
            
        }
        .buttonStyle(.plain)
        .labelStyle(.iconOnly)
    }
}


struct PhaseListItemStyle: DisclosureGroupStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            
            Button("Expand", systemImage: "chevron.up.chevron.down") {
                configuration.isExpanded.toggle()
            }
            .buttonStyle(.plain)
            .labelStyle(.iconOnly)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(16)
        .background(.muted.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: radius))
    }
}
