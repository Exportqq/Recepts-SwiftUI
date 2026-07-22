import SwiftUI

struct TabBarController: View {

    @State private var selectedIndex: Int = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            tabContent

            CustomTabBarView(selectedIndex: $selectedIndex)
                .padding(.horizontal, 57)
                .padding(.bottom, 34)
        }
        .ignoresSafeArea(edges: .bottom)
        .navigationBarBackButtonHidden(true)
    }

    @ViewBuilder
    private var tabContent: some View {
        switch selectedIndex {
        case 0: MainView()
        case 1: MainView()
        case 2: ProfileView()
        default: MainView()
        }
    }
}
