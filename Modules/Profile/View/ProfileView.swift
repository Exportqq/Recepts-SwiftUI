import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
        
    var body: some View {
        VStack(alignment: .center) {
            Text(viewModel.screenTitle)
                .foregroundColor(Color.customBlack)
                .font(.interBold(24))
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .shadow(
                        color: Color(red: 0x06 / 255, green: 0x33 / 255, blue: 0x36 / 255).opacity(0.1),
                        radius: 16,
                        x: 0,
                        y: 2
                    )
                
                HStack(alignment: .center, spacing: 16) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .fill(Color.customBlue)
                            .frame(width: 50, height: 50)
                        
                        Image("profile_recepts")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(viewModel.user?.username ?? "")
                            .foregroundColor(Color.customBlack)
                            .font(.interSemiBold(18))
                        
                        Text(viewModel.userRole)
                            .font(.interRegular(14))
                            .foregroundColor(Color.customGrey)
                    }
                    
                    Spacer()
                    
                    Image("logout_recepts")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .onTapGesture {
                            SessionManager.shared.logout()
                        }
                }
                .padding(.horizontal, 16)
            }
            .padding(.top, 24)
            .padding(.horizontal, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
        .padding(.top, 60)
        .onAppear {
            Task {
                await viewModel.fetchProfile()
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
