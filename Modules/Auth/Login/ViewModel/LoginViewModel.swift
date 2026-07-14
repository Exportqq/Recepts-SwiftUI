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
    
    private let loginManager: LoginManager
    private var cancellables = Set<AnyCancellable>()
    
    init(loginManager: LoginManager = LoginManager()) {
        self.loginManager = loginManager
        setupValidation()
    }
    
    private func setupValidation() {
        Publishers.CombineLatest($username, $password)
            .map { username, password in
                username.trimmingCharacters(in: .whitespacesAndNewlines).count >= 3 &&
                password.count >= 6
            }
            .receive(on: DispatchQueue.main)
            .assign(to: &$isFormValid)
    }
    
    func login(loading: LoadingState) {
        guard isFormValid else { return }

        isLoading = true
        error = nil

        Task {
            loading.show()
            do {
                let loginResponse = try await loginManager.login(
                    username: username,
                    password: password
                )

                KeychainService.shared.saveToken(loginResponse.token)

                await MainActor.run {
                    SessionManager.shared.isAuthorized = true
                    self.isSuccess = true
                    
                    print(KeychainService.shared.getToken())
                }

            } catch {
                await MainActor.run {
                    self.error = error.localizedDescription
                }
            }

            await MainActor.run {
                self.isLoading = false
            }
            loading.hide()
        }
    }
}
