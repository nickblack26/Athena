import SwiftUI

struct Accordion: DisclosureGroupStyle {
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
        
        configuration.content
            .frame(height: configuration.isExpanded ? 199 : 0)
            .onChange(of: configuration.isExpanded) { oldValue, newValue in
                print(oldValue, newValue)
            }
    }
}

#Preview {
    DisclosureGroup("") {
        VStack {
            Text("Hello")
        }
    }
    .disclosureGroupStyle(Accordion())
}
