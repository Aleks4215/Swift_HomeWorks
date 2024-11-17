//
//  APIHelper.swift
//  hw29
//
//  Created by Алексей on 19.09.24.
//

import Foundation

class APIHelper {
    
    static let shared = APIHelper()
    private let sharedSession = URLSession.shared
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    private init() { }
    
     enum APIRoutes {
        static let posts = "https://jsonplaceholder.typicode.com/posts"
        static let users = "https://jsonplaceholder.typicode.com/users"
        static let photos = "https://jsonplaceholder.typicode.com/photos"
        static let post = "https://jsonplaceholder.typicode.com/posts/"
        static let user = "https://jsonplaceholder.typicode.com/users/"
    }
    
    func configureURLRequest(for route: String) -> URLRequest? {
        guard let url = URL(string: route) else { return nil }
        let request = URLRequest(url: url)
        return request
    }
    
    func getUsers(completion: @escaping ([User]) -> Void) {
        guard let request = configureURLRequest(for: APIRoutes.users) else { return }
        
        let task = sharedSession.dataTask(with: request) { [weak self] data, error, _ in
            guard let data else { return }
            guard let users: [User] = try? self?.decoder.decode([User].self, from: data) else { return }
            DispatchQueue.main.async {
                completion(users)
            }
        }
        task.resume()
    }
    
    func getUser(id: Int, completion: @escaping (User) -> Void) {
        guard let request = configureURLRequest(for: APIRoutes.user + String(id)) else { return }
        
        let task = sharedSession.dataTask(with: request) { [weak self] data, _, _ in
            guard let data else { return }
            guard let user: User = try! self?.decoder.decode(User.self, from: data) else { return }
            DispatchQueue.main.async {
                completion(user)
            }
        }
        task.resume()
    }
    
    func getPosts(completion: @escaping ([Post]) -> Void) {
        guard let request = configureURLRequest(for: APIRoutes.posts) else { return }
        
        let task = sharedSession.dataTask(with: request) { [weak self] data, error, _ in
            guard let data else { return }
            guard let posts: [Post] = try? self?.decoder.decode([Post].self, from: data) else { return }
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        task.resume()
    }
    
    func getPost(id: Int, completion: @escaping (Post) -> Void) {
            guard let request = configureURLRequest(for: APIRoutes.post + String(id)) else { return }
            
            let task = sharedSession.dataTask(with: request) { [weak self] data, _ , error in
                guard let data else { return }
                guard let post: Post = try? self?.decoder.decode(Post.self, from: data) else { return }
                DispatchQueue.main.async {
                    completion(post)
                }
            }
            task.resume()
        }
    
    func deletePost(id: Int, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: APIRoutes.post + String(id)) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        let task = sharedSession.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Ошибка удаления: \(error)")
                completion(false)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(false)
                return
            }
            completion(true)
        }
        task.resume()
    }
    
    func createPost(userId: Int, title: String, body: String, completion: @escaping () -> Void) {
        guard let url = URL(string: APIRoutes.posts) else { return }
        
        let post = Post(userId: userId, id: nil, title: title, body: body)
        guard let httpBody = try? encoder.encode(post) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = httpBody
        
        let task = sharedSession.dataTask(with: request) { data, response, error in
            if let error = error {
                print("ошибка при создании запроса: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
                print("ошибка загрузки: \(response)")
                return
            }
            
            if let data = data, let responseBody = String(data: data, encoding: .utf8) {
                print("Ответ: \(responseBody)")
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
        task.resume()
    }
    
    func updatePost(id: Int, title: String, body: String, completion: @escaping () -> Void) {
        guard let url = URL(string: APIRoutes.post + String(id)) else { return }
        
        let updatedPost = Post(userId: 1, id: id, title: title, body: body)
        guard let httpBody = try? encoder.encode(updatedPost) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = httpBody
        
        let task = sharedSession.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Ошибка при обновлении: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Ошибка при обновлении поста: \(response)")
                return
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
        task.resume()
    }

    
    func getPhotos(completion: @escaping ([Photo]) -> Void) {
        guard let request = configureURLRequest(for: APIRoutes.photos) else { return }
        
        let task = sharedSession.dataTask(with: request) { [weak self] data, error, _ in
            guard let data else { return }
            guard let photos: [Photo] = try? self?.decoder.decode([Photo].self, from: data) else { return }
            DispatchQueue.main.async {
                completion(photos)
            }
        }
        task.resume()
    }
}
