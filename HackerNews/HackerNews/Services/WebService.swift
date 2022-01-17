//
//  WebService.swift
//  HackerNews
//
//  Created by Matthew Fraser on 2022-01-16.
//

import Foundation
import Combine

class WebService {

    func getStoryById(id: Int) -> AnyPublisher<Story, Error> {
        guard let url = URL(
            string: "https://hacker-news.firebaseio.com/v0/item/\(id).json?print=prett"
        ) else {
            fatalError("Invalid URL")
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: Story.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    private func mergeStories(ids storyIds: [Int]) -> AnyPublisher<Story, Error> {
        let storyIds = Array(storyIds.prefix(50))

        let initPublisher = getStoryById(id: storyIds[0])
        let remainder = Array(storyIds.dropFirst())
 
        return remainder.reduce(initPublisher) { combined, id in
            return combined.merge(with: getStoryById(id: id))
                .eraseToAnyPublisher()
        }
    }

    func getTopStories() -> AnyPublisher<[Story], Error> {
        guard let url = URL(
            string: "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"
        ) else {
            fatalError("Invalid URL")
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: [Int].self, decoder: JSONDecoder())
            .flatMap { storyIds in
                return self.mergeStories(ids: storyIds)
                
            }
            .scan([]) { stories, story -> [Story] in
                return stories + [story]
            }
            .eraseToAnyPublisher()
    }
}
