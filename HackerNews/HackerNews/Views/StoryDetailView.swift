//
//  StoryDetailView.swift
//  HackerNews
//
//  Created by Matthew Fraser on 2022-01-16.
//

import SwiftUI

struct StoryDetailView: View {
    @ObservedObject private var storyDetailVM: StoryDetailViewModel

    var storyId: Int

    init(storyId: Int) {
        self.storyId = storyId
        self.storyDetailVM = StoryDetailViewModel()
    }

    var body: some View {
        VStack {
            Text(self.storyDetailVM.title)
            WebView(url: storyDetailVM.url)
        }.onAppear {
            self.storyDetailVM.fetchStoryDetails(storyId: storyId)
        }
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailView(storyId: 100)
    }
}
