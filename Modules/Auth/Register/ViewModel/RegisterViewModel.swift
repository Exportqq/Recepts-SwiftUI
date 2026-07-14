import Foundation
import Combine

protocol RegisterViewModelInputProtocol: AnyObject {
    var greetingText: String { get }
    var greetingDescription: String { get }
    var emailText: String { get }
    var passwordText: String { get }
    var goToLoginText: String { get }
}

final class RegisterViewModel: RegisterViewModelInputProtocol, ObservableObject {
    
    var greetingText: String = "Get Started now"
    var greetingDescription: String = "Create an account or log in to explore about our app"
    var emailText: String = "Email"
    var passwordText: String = "Password"
    var goToLoginText: String = "You already have an account?"
    
    @Published var username: String = ""
    @Published var password: String = ""
    
    @Published var isFormValid: Bool = false
    @Published var isLoading: Bool = false
    @Published var error: String?
    @Published var isSuccess: Bool = false
    
    private let registerManager: RegisterManager
    private let loginManager: LoginManager
    private var cancellables = Set<AnyCancellable>()
    
    init(registerManager: RegisterManager = RegisterManager(),
         loginManager: LoginManager = LoginManager()) {
        self.registerManager = registerManager
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

                KeychainService.shared.saveToken(loginResponse.token)

                await MainActor.run {
                    SessionManager.shared.isAuthorized = true
                    self.isSuccess = true
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
