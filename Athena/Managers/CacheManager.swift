//
//  CacheManager.swift
//  Athena
//
//  Created by Nick Black on 9/6/24.
//

import Foundation

enum CacheEntry {
    case inProgress(Task<Any, Error>)
    case ready(Any)
}

final class CacheEntryObject {
    let entry: CacheEntry
    init(entry: CacheEntry) { self.entry = entry }
}

extension NSCache where KeyType == NSString, ObjectType == CacheEntryObject {
    subscript(_ key: String) -> CacheEntry? {
        get {
            let value = object(forKey: key as NSString)
            return value?.entry
        }
        set {
            if let entry = newValue {
                let value = CacheEntryObject(entry: entry)
                setObject(value, forKey: key as NSString)
            } else {
                removeObject(forKey: key as NSString)
            }
        }
    }
}

//protocol Cachable {
//    var cache: NSCache<NSString, CacheEntryObject> { get set }
//    var request: URLRequest { get set }
//    
//    func getItem<T>(_ type: T.Type, from module: Module) async throws -> T where T: Codable
//    func getItems<T>(_ type: [T].Type, from module: Module) async throws -> [T] where T: Codable
//    
//    func createItem<T>(item: T.Type, from module: Module) async throws -> T where T: Codable
//}
//
//extension Cachable {
//    func getItem<T>(_ type: T.Type, from module: Module) async throws -> T where T: Codable {
//        if let cached = cache[module.endpoint] {
//            switch cached {
//            case .ready(let item):
//                return item as! T
//            case .inProgress(let task):
//                return try await task.value as! T
//            }
//        }
//        
//        let task = Task<Any, Error> {
//            var request = self.request
//            request.url?.appendPathComponent(module.endpoint, conformingTo: .url)
//            request.httpMethod = "GET"
//            let (data, _) = try await URLSession.shared.data(for: request)
//            let decodedData = try JSONDecoder().decode(type, from: data)
//            return decodedData
//        }
//        
//        cache[module.endpoint] = .inProgress(task)
//        
//        do {
//            let item = try await task.value
//            cache[module.endpoint] = .ready(item)
//            return item as! T
//        } catch {
//            cache[module.endpoint] = nil
//            throw error
//        }
//    }
//    
//    func getItems<T>(_ type: [T].Type, from module: Module) async throws -> [T] where T: Codable  {
//        if let cached = cache[module.endpoint] {
//            switch cached {
//            case .ready(let item):
//                return item as! T as! [T]
//            case .inProgress(let task):
//                return try await task.value as! T as! [T]
//            }
//        }
//        
//        let task = Task<Any, Error> {
//            var request = self.request
//            request.url?.appendPathComponent(module.endpoint, conformingTo: .url)
//            request.httpMethod = "GET"
//            let (data, _) = try await URLSession.shared.data(for: request)
//            let decodedData = try JSONDecoder().decode(type, from: data)
//            return decodedData
//        }
//        
//        cache[module.endpoint] = .inProgress(task)
//        
//        do {
//            let item = try await task.value
//            cache[module.endpoint] = .ready(item)
//            return item as! T as! [T]
//        } catch {
//            cache[module.endpoint] = nil
//            throw error
//        }
//    }
//    
//    func createItem<T>(item: T.Type, from module: Module) async throws -> T where T: Codable {
//        let task = Task<Any, Error> {
//            var request = self.request
//            request.url?.appendPathComponent(module.endpoint, conformingTo: .url)
//            request.httpMethod = "POST"
//            let (data, _) = try await URLSession.shared.data(for: request)
//            let decodedData = try JSONDecoder().decode(T.self, from: data)
//            return decodedData
//        }
//        
//        do {
//            cache[module.endpoint] = try await .ready(task.value)
//            return try await task.value as! T
//        } catch {
//            cache[module.endpoint] = nil
//            throw error
//        }
//    }
//}
