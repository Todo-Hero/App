
// BE BACK SOON!!

import FairApp

/// The main content view for the app.
public struct ContentView: View {
    @EnvironmentObject var store: Store

    public var body: some View {
        VStack {
            Text("Welcome to **\(Bundle.main.bundleName!)**")
                .font(.largeTitle)
                .foregroundColor(.pink)
            Text("it will do something _soon_")
                .font(.headline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

/// The shared app environment
@MainActor public final class Store: SceneManager {
    @AppStorage("someToggle") public var someToggle = false
}

public extension AppContainer {
    @SceneBuilder static func rootScene(store: Store) -> some SwiftUI.Scene {
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }

    /// The app-wide settings view
    @ViewBuilder static func settingsView(store: Store) -> some SwiftUI.View {
        AppSettingsView().environmentObject(store)
    }
}

public struct AppSettingsView : View {
    @EnvironmentObject var store: Store

    public var body: some View {
        Toggle(isOn: $store.someToggle) {
            Text("Toggle")
        }
        .padding()
    }
}
