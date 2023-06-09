//
//  ArticleNewYorkTimesAPIRepository.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 08/06/23.
//

import Foundation

class ArticleNewYorkTimesAPIRepository: ArticleRepository {
    
    func getNews(amount: Int?, page: Int?, category: CategoryModel?, completionHandler: @escaping NewsResult) {
        let section = category == .general || category == nil ? "home" : category?.rawValue ?? ""
        let endpoint = NewYorkTimesAPIEndpoint.topStories(section: section)
        
        WebService().get(type: NewYorkTimesAPIResponse.self, endpoint) { result in
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
extension ArticleNewYorkTimesAPIRepository {

    private func filterResponse(_ response: NewYorkTimesAPIResponse) -> [ArticleModel] {
        return response.results.compactMap {
            guard let title = $0.title,
                  let description = $0.abstract,
                  let authorName = $0.byline,
                  let imageURL = $0.multimedia?.first?.url,
                  let sourceURL = $0.url,
                  let publicationDate = Date.fromISOString($0.createdDate ?? "") else { return nil }
            return ArticleModel(title: title, description: description, content: "", authorName: authorName, imageURL: imageURL, sourceURL: sourceURL, publicationDate: publicationDate)
        }
    }

}
