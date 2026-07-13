import Foundation
import Combine

protocol LoginViewModelInputProtocol: AnyObject {
    var greetingText: String { get }
    var greetingDescription: String { get }
    var emailText: String { get }
    var passwordText: String { get }
    var goToRegisterText: String { get }
}

final class LoginViewModel: LoginViewModelInputProtocol, ObservableObject {
    
    var greetingText: String = "Welcome back !"
    var greetingDescription: String = "Enter your details and log in to your account."
    var emailText: String = "Email"
    var passwordText: String = "Password"
    var goToRegisterText: String = "You do not have an account?"
    
    @Published var username: String = ""
    @Published var password: String = ""
    
    @Published var isFormValid: Bool = false
    @Published var isLoading: Bool = false
    @Published var error: String?
    @Published var isSuccess: Bool = false
    
    private let registerManager: RegisterManager
    private let loginManager: LoginManager
    
    init(registerManager: RegisterManager = RegisterManager(),
         loginManager: LoginManager = LoginManager()) {
        self.registerManager = registerManager
        self.loginManager = loginManager
    }
    
    func register(loading: LoadingState) {
        guard isFormValid else { return }

        isLoading = true
        error = nil

        Task {
            loading.show()
            do {
                _ = try await registerManager.register(
                    username: username,
                    password: password
                )

                let loginResponse = try await loginManager.login(
                    username: username,
                    password: password
                )

                print("TOKEN:", loginResponse.token)

                KeychainService.shared.saveToken(loginResponse.token)

                await MainActor.run {
                    SessionManager.shared.isAuthorized = true
                }

            } catch {
                self.error = error.localizedDescription
            }

            self.isLoading = false
            loading.hide()
        }
    }
}
