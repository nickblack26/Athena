import SwiftUI

struct Input: TextFieldStyle {
    var isFocused: Bool = false
    var background = Color.background
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .textFieldStyle(.plain)
            .padding(.horizontal, radius * 0.75)
            .padding(.vertical, radius * 0.375)
            .frame(height: 36)
            .background {
                RoundedRectangle(cornerRadius: radius * 0.5)
                    .fill(background)
                    .strokeBorder(
                        .borderInput,
                        style: .init(lineWidth: 1)
                    )
            }
            .padding(2)
            .overlay {
                RoundedRectangle(cornerRadius: (radius * 0.5) + 2)
                    .fill(.clear)
                    .strokeBorder(
                        isFocused ? .accent : .clear,
                        style: .init(lineWidth: 1)
                    )
            }
    }
}

#Preview {
    VStack {
        TextField(
            "Email",
            text: .constant(""),
            prompt: Text("Email")
        )
        .textFieldStyle(Input())
    }
    .frame(minWidth: 500, minHeight: 500)
    .background(Color.muted.opacity(0.50))
}
