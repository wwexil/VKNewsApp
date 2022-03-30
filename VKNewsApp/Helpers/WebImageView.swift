//
//  WebImageView.swift
//  VKNewsApp
//
//  Created by Алекс Мерсер on 29.03.2022.
//

import UIKit

class WebImageView: UIImageView {
    
    func set(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: cachedResponse.data)
            print("from cashe")
            return
        }
        
        print("from internet")
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.image = UIImage(data: data)
                    self?.handleLoadedImage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }
    
    private func handleLoadedImage(data: Data, response: URLResponse) {
        guard let responseURL = response.url else { return }
        let cashedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cashedResponse, for: URLRequest(url: responseURL))
    }
}
