import SwiftUI
import Combine

class LoadingState: ObservableObject {
    @Published var isLoading = false
    @Published var text: String?

    func show(text: String? = nil) {
        isLoading = true
        self.text = text
    }

    func hide() {
        isLoading = false
        text = nil
    }
}
