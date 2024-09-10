import SwiftUI

struct OutlineButtonStyle: ButtonStyle {
    @State private var isHovering: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 36)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background {
                RoundedRectangle(cornerRadius: 6)
                    .fill(isHovering || configuration.isPressed ? .muted : Color.background)
                    .strokeBorder(.muted, lineWidth: 1)
            }
            .onHover { isHovering = $0 }
            .animation(.snappy(duration: 0.15), value: isHovering)
    }
}

#Preview("Outline Button Style") {
    VStack {
        Button("Add New", systemImage: "plus") {
        }
        .buttonStyle(OutlineButtonStyle())
    }
    .padding()
    .frame(minWidth: 500, minHeight: 500)
    .background(Color.background)
}
