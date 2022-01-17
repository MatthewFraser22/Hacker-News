//
//  StoryListViewModel.swift
//  HackerNews
//
//  Created by Matthew Fraser on 2022-01-16.
//

import Foundation
import Combine

class StoryListViewModel: ObservableObject {

    @Published var stories = [StoryViewModel]()
    private var cancellable: AnyCancellable?

    init() {
        fetchTopStories()
    }

    private func fetchTopStories() {
        self.cancellable = WebService().getTopStories()
            .map { stories in
                stories.map { StoryViewModel(story: $0)}
            }
            .sink(
                receiveCompletion: { _ in},
                receiveValue: { storyViewModel in
                    self.stories = storyViewModel
                })
    }
}

struct StoryViewModel {
    let story: Story

    var id: Int {
        return story.id
    }

    var title: String {
        return story.title
    }

    var url: String {
        return story.url
    }
}
