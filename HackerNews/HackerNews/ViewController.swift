//
//  ViewController.swift
//  HackerNews
//
//  Created by Matthew Fraser on 2022-01-16.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    // MARK: IBOutlets

    @IBOutlet weak var storyViewContainer: UIView!

    // MARK: Initializtion

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIHostingController()
    }

    // MARK: Functions

    private func setupUIHostingController() {
        let storyListViewController = UIHostingController(
            rootView: StoryListView()
        )

        storyListViewController.view.translatesAutoresizingMaskIntoConstraints = false

        self.addChild(storyListViewController)
        storyListViewController.didMove(toParent: self)
        storyViewContainer.addSubview(storyListViewController.view)

        NSLayoutConstraint.activate([
            storyListViewController.view.leadingAnchor.constraint(equalTo: storyViewContainer.leadingAnchor),
            storyListViewController.view.trailingAnchor.constraint(equalTo: storyViewContainer.trailingAnchor),
            storyListViewController.view.topAnchor.constraint(equalTo: storyViewContainer.topAnchor),
            storyListViewController.view.bottomAnchor.constraint(equalTo: storyViewContainer.bottomAnchor),
            storyListViewController.view.heightAnchor.constraint(equalTo: storyViewContainer.heightAnchor)
        ])
    }

}
