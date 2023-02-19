//
//  MessengerViewController.swift
//  FrameBuilderExample
//
//  Created by Vladislav Kulikov on 19.02.2023.
//

import UIKit

final class MessengerViewController: UIViewController {
    
    // MARK: - Views
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        tableView.rowHeight = 72
        tableView.register(MessengerDialogCell.self, forCellReuseIdentifier: MessengerDialogCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    // MARK: - Private Properties
    
    private let dialogs = [
        MessengerDialogCell.Configuration(
            avatarUrl: "https://xsgames.co/randomusers/assets/avatars/male/46.jpg",
            name: "Otis Hayson",
            lastMessage: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
            lastMessageTime: .now
        ),
        MessengerDialogCell.Configuration(
            avatarUrl: "https://xsgames.co/randomusers/assets/avatars/male/58.jpg",
            name: "Chas Satchell",
            lastMessage: "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
            lastMessageTime: .now
        ),
        MessengerDialogCell.Configuration(
            avatarUrl: "https://xsgames.co/randomusers/assets/avatars/male/20.jpg",
            name: "Winfred Intrieri",
            lastMessage: nil,
            lastMessageTime: nil
        ),
        MessengerDialogCell.Configuration(
            avatarUrl: "https://xsgames.co/randomusers/assets/avatars/male/59.jpg",
            name: "Quincy Purpera",
            lastMessage: "Ut enim ad minim veniam",
            lastMessageTime: .now
        ),
        MessengerDialogCell.Configuration(
            avatarUrl: "https://xsgames.co/randomusers/assets/avatars/male/25.jpg",
            name: "Zackary Bigeagle",
            lastMessage: nil,
            lastMessageTime: nil
        ),
    ]
    
    // MARK: - UIViewController Lifecycle
    
    override func loadView() {
        super.loadView()
        
        setupViews()
    }
    
    // MARK: - Setup Views
    
    func setupViews() {
        setupNavigationBar()
        setupTableView()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Messenger"
        navigationItem.largeTitleDisplayMode = .always
    }

    private func setupTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor
                .constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor
                .constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor
                .constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor
                .constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension MessengerViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dialogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessengerDialogCell.reuseIdentifier, for: indexPath) as? MessengerDialogCell else {
            return UITableViewCell()
        }
        
        let dialog = dialogs[indexPath.row]
        cell.configure(with: dialog)
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension MessengerViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
