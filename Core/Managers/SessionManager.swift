import Foundation
import Combine

@MainActor
final class SessionManager: ObservableObject {

    static let shared = SessionManager()
    private init() {}

    @Published var isAuthorized: Bool = false

    func checkAuth() {
        isAuthorized = KeychainService.shared.getToken() != nil
    }

    func logout() {
        KeychainService.shared.deleteToken()
        isAuthorized = false
    }
}
