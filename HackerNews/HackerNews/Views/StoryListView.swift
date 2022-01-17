//
//  StoryListView.swift
//  HackerNews
//
//  Created by Matthew Fraser on 2022-01-16.
//

import SwiftUI

struct StoryListView: View {
    @ObservedObject private var storyListViewModel = StoryListViewModel()

    var body: some View {
        NavigationView {
            List(storyListViewModel.stories, id: \.id) { storyVM in
                NavigationLink(
                    destination: StoryDetailView(storyId: storyVM.id)) {
                        Text("\(storyVM.title)")
                }
                
            }.navigationBarTitle("Hacker News")
        }
    }
}
