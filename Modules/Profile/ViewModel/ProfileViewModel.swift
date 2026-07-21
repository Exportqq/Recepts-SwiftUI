import Foundation
import Combine

protocol ProfileViewModelInputProtocol: AnyObject {
    var screenTitle: String { get }
    var userRole: String { get }
    var user: ProfileResponse? { get }
    var userPublisher: Published<ProfileResponse?>.Publisher { get }
}

final class ProfileViewModel: ProfileViewModelInputProtocol, ObservableObject {
    
    var screenTitle: String = "Account"
    var userRole: String = "Recipe Developer"
    
    @Published private(set) var user: ProfileResponse?
    @Published var isLoading: Bool = false
    
    var userPublisher: Published<ProfileResponse?>.Publisher { $user }

    @MainActor
    func fetchProfile() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let result: ProfileResponse = try await ApiClient.shared.request(
                "\(APIConstants.baseURL)/profile",
                method: .get
            )
            self.user = result
//            return result
        } catch {
            print("Error profile: \(error)")
//            return nil
        }
    }
}


