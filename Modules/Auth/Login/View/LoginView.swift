import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            VStack(alignment: .leading, spacing: 12) {
                Text(viewModel.greetingText)
                    .font(.interBold(32))
                    .foregroundColor(Color.white)
                
                Text(viewModel.greetingDescription)
                    .font(.interRegular(12))
                    .foregroundColor(Color.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 120)
            .padding(.horizontal, 24)
            
            ZStack(alignment: .top) {
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(24)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 16) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(viewModel.emailText)
                                .foregroundColor(.customGrey)
                                .font(.interMedium(12))
                            
                            CustomTextField(placeholder: "Name", text: $viewModel.username)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(viewModel.passwordText)
                                .foregroundColor(.customGrey)
                                .font(.interMedium(12))
                            
                            CustomTextField(placeholder: "Password", text: $viewModel.username)
                        }
                        
                        Text(viewModel.goToRegisterText)
                            .foregroundColor(.link)
                            .font(.interSemiBold(12))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .onTapGesture {
                                dismiss()
                            }
                    }
                    
                    
                    CustomButtonView(title: "Login") {
                        print("test")
                    }
                    
                }
                .padding(.top, 30)
                .padding(.horizontal, 24)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .background(Color.brand)
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
