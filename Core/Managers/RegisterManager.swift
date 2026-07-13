import Foundation

final class RegisterManager {

    static let shared = RegisterManager()

    func register(
        username: String,
        password: String
    ) async throws -> LoginModel {

        let body: [String: Any] = [
            "username": username,
            "password": password
        ]

        let response: LoginModel = try await ApiClient.shared.request(
            "\(APIConstants.baseURL)/auth/register",
            method: .post,
            body: body
        )

        KeychainService.shared.saveToken(response.token)
        return response
    }
}
