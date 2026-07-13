import SwiftUI

struct CustomButtonView: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.interMedium(14))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(.brand)
                .cornerRadius(12)
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        CustomButtonView(title: "Filled Button") {
            print("Filled tapped")
        }
    }
    .padding()
}
