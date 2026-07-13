import SwiftUI
import Combine

struct CustomTextField: View {
    
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .font(.custom("Poppins-Regular", size: 16))
            .foregroundColor(.black)
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.customLigthGrey, lineWidth: 1)
            )
    }
}

#Preview {
    CustomTextField(placeholder: "Email", text: .constant(""))
        .padding()
}
