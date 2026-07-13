import SwiftUI

struct LoadingModifier: ViewModifier {
    @ObservedObject var state: LoadingState

    func body(content: Content) -> some View {
        ZStack {
            content
            if state.isLoading {
                LoadingView(text: state.text)
                    .transition(.opacity.animation(.easeInOut(duration: 0.2)))
            }
        }
    }
}

extension View {
    func loader(_ state: LoadingState) -> some View {
        modifier(LoadingModifier(state: state))
    }
}
