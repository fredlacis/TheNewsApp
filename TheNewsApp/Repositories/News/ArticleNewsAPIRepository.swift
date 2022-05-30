//
//  ArticleNewsAPIRepository.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 25/05/22.
//

import Foundation

class ArticleNewsAPIRepository: ArticleRepository {
    
    func getNews(ammount: Int?, page: Int?, category: Category, completionHandler: @escaping NewsResult) {
        let endpoint = NewsAPIEndpoint.news(ammount: ammount, page: page, category: category)
        
        WebService().get(type: NewsAPIResponse.self, endpoint) { result in
            switch result {
                case .success(let response):
                    let filteredResponse = self.filterResponse(response)
                    completionHandler(.success(filteredResponse))
                case .failure(let error):
                    completionHandler(.failure(error))
            }
        }
    }
    
}

// MARK: - Private Methods
extension ArticleNewsAPIRepository {

    private func filterResponse(_ response: NewsAPIResponse) -> [Article] {
        return response.articles.compactMap {
            guard let title = $0.title,
                  let description = $0.description,
                  let content = $0.content,
                  let authorName = $0.authorName,
                  let imageURL = $0.imageURL,
                  let sourceURL = $0.sourceURL,
                  let publicationDate = Date.fromISOString($0.publicationDate ?? "") else { return nil }
            return Article(title: title, description: description, content: content, authorName: authorName, imageURL: imageURL, sourceURL: sourceURL, publicationDate: publicationDate)
        }
    }
    
}
