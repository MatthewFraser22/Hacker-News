//
//  StoryDetailViewModel.swift
//  HackerNews
//
//  Created by Matthew Fraser on 2022-01-16.
//

import Foundation
import Combine

class StoryDetailViewModel: ObservableObject {

    @Published private var story = Story.placeholder()
    private var cancellable: AnyCancellable?

    init() {}

    func fetchStoryDetails(storyId: Int) {
        cancellable = WebService().getStoryById(id: storyId)
            .catch { _ in Just(Story.placeholder()) }
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { story in
                    self.story = story
            })
    }
}

extension StoryDetailViewModel {
    var title: String {
        story.title
    }

    var url: String {
        story.url
    }
}
