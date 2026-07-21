import SwiftUI

struct RootView: View {
    @ObservedObject var session = SessionManager.shared
    
    var body: some View {
        Group {
            if session.isAuthorized {
                NavigationStack {
                    ProfileView()
                }
            } else {
                NavigationStack {
                    RegisterView()
                }
            }
        }
        .onAppear {
            session.checkAuth()
        }
    }
}
