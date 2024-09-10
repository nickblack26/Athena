import Foundation

class ConnectWiseClient {
    var request: URLRequest
    var cache: NSCache<NSString, CacheEntryObject> = NSCache()
    
    init(
        url: URL,
        username: String,
        password: String,
        clientId: String
    ) {
        self.request = URLRequest(url: url)
        self.request.addValue(clientId, forHTTPHeaderField: "clientId")
        self.request.addValue("Basic \(String("velo+\(username):\(password)").toBase64())", forHTTPHeaderField: "Authorization")
    }
}

extension ConnectWiseClient {
    func getItem<T>(_ type: T.Type, from module: Module, with conditions: Conditions<T>? = nil) async throws -> T where T: Codable {
        if let cached = cache[module.endpoint] {
            switch cached {
            case .ready(let item):
                return item as! T
            case .inProgress(let task):
                return try await task.value as! T
            }
        }
        
        let task = Task<Any, Error> {
            var request = self.request
            request.url?.appendPathComponent(module.endpoint, conformingTo: .url)
            request.httpMethod = "GET"
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedData = try JSONDecoder().decode(type, from: data)
            return decodedData
        }
        
        cache[module.endpoint] = .inProgress(task)
        
        do {
            let item = try await task.value
            cache[module.endpoint] = .ready(item)
            return item as! T
        } catch {
            cache[module.endpoint] = nil
            throw error
        }
    }
    
    func getItems<T>(_ type: T.Type, from module: Module, with conditions: Conditions<T>? = nil) async throws -> [T] where T: RandomAccessCollection,  T: Codable  {
        if let cached = cache[module.endpoint] {
            switch cached {
            case .ready(let item):
                return item as! [T]
            case .inProgress(let task):
                return try await task.value as! [T]
            }
        }
        
        let task = Task<Any, Error> {
            var request = self.request
            request.url?.appendPathComponent(module.endpoint, conformingTo: .url)
            request.httpMethod = "GET"
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedData = try JSONDecoder().decode(type, from: data)
            return decodedData
        }
        
        cache[module.endpoint] = .inProgress(task)
        
        do {
            let item = try await task.value
            cache[module.endpoint] = .ready(item)
            return item as! T as! [T]
        } catch {
            cache[module.endpoint] = nil
            throw error
        }
    }
    
    func createItem<T>(item: T.Type, from module: Module, with conditions: Conditions<T>? = nil) async throws -> T where T: Codable {
        let task = Task<Any, Error> {
            var request = self.request
            request.url?.appendPathComponent(module.endpoint, conformingTo: .url)
            request.httpMethod = "POST"
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        }
        
        do {
            cache[module.endpoint] = try await .ready(task.value)
            return try await task.value as! T
        } catch {
            cache[module.endpoint] = nil
            throw error
        }
    }
}

enum Module {
    case system(SystemEndpoint), service(ServiceEndpoint), project(ProjectEndpoint)
    
    var endpoint: String {
        switch self {
        case .system(let systemEndpoint):
            "/system\(systemEndpoint.endpoint)"
        case .service(let serviceEndpoint):
            "/service\(serviceEndpoint.endpoint)"
        case .project(let projectEndpoint):
            "/project\(projectEndpoint.endpoint)"
        }
    }
    
    enum SystemEndpoint {
        case members(Int? = nil)
        
        var endpoint: String {
            switch self {
            case .members(let int):
                if let int {
                    return "/members/\(int)"
                } else {
                    return "/members"
                }
            }
        }
    }
    
    enum ServiceEndpoint {
        case tickets(Int? = nil)
        
        var endpoint: String {
            switch self {
            case .tickets(let int):
                if let int {
                    return "/tickets/\(int)"
                } else {
                    return "/tickets"
                }
            }
        }
    }
    
    enum ProjectEndpoint {
        case tickets(Int? = nil)
        case projectTemplates(Int? = nil)
        
        var endpoint: String {
            switch self {
            case .tickets(let int):
                if let int {
                    return "/tickets/\(int)"
                } else {
                    return "/tickets"
                }
                
            case .projectTemplates(let int):
                if let int {
                    return "/projectTemplates/\(int)"
                } else {
                    return "/projectTemplates"
                }
            }
        }
    }
}

extension String {
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}

struct Conditions<T> {
    var conditions: [PartialKeyPath<T>:Any]? = nil
    var childConditions: [PartialKeyPath<T>:Any]? = nil
    var customFieldConditions: [PartialKeyPath<T>:Any]? = nil
    var orderBy: (PartialKeyPath<T>, Order)? = nil
    var fields: [PartialKeyPath<T>]? = nil
    var page: Int? = nil
    var pageSize: Int? = nil
    
    func generateQueryParams() {
        if let conditions, !conditions.isEmpty {}
        if let childConditions, !childConditions.isEmpty {}
        if let customFieldConditions, !customFieldConditions.isEmpty {}
        if let orderBy {}
        if let fields {}
        if let page {}
        if let pageSize {}
    }
    
    enum Order: String {
        case asc, desc
    }
}
