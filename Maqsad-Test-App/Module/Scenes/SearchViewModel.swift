//
//  SearchViewModel.swift
//  Maqsad-Test-App
//
//  Created by Mohsin Hassan on 04/10/2022.
//

import Foundation
import UIKit

protocol SearchViewModelDelegate: NSObjectProtocol {
    func dataFetchSuccessfully(from: SearchViewModel, data: [Items])
}

class SearchViewModel {
    
    weak var controller: UIViewController?
    
    var data: [Items]?
    weak var delegate: SearchViewModelDelegate?

    
    init(controller: UIViewController) {
        self.controller = controller
        delegate = controller as? SearchViewModelDelegate

    }
    
    func bootstrap() {
    }
}

extension SearchViewModel {
    func getRequest(text: String) {
        
        let url = "https://api.github.com/search/users"
        
        var components = URLComponents(string: url)!
        components.queryItems = [
            .init(name: "q", value: text)
        ]
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.addValue("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", forHTTPHeaderField: "x-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else { print(error!.localizedDescription); return }
            guard let data = data else { print("Empty data"); return }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(DataResponse.self, from: data)
                self.data = decodedData.items ?? []
                self.delegate?.dataFetchSuccessfully(from: self, data: decodedData.items ?? [])
            } catch {
                debugPrint(error)
            }
            
        }.resume()
        
    }
    
    }

