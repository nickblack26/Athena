import Foundation

final class ConnectWiseManager {
    let client: ConnectWiseClient
    
    static let shared = ConnectWiseManager()
    
    private init() {
        self.client = .init(
            url: URL(string: ProcessInfo.processInfo.environment["CONNECTWISE_URL"] ?? "")!,
            username: "X32LB4Xx5GW5MFNz",
            password: "XcwrfwGpCODhSpvD",
            clientId: "900822ef-aa1c-4f08-aae6-f070919b56fa"
        )
    }
}
