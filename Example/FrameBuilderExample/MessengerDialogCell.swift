//
//  MessengerDialogCell.swift
//  FrameBuilderExample
//
//  Created by Vladislav Kulikov on 19.02.2023.
//

import UIKit
import FrameBuilder

final class MessengerDialogCell: UITableViewCell {
    
    // MARK: - Static Properties
    
    static let reuseIdentifier = String(describing: MessengerDialogCell.self)
    
    // MARK: - Views
    
    private let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 24
        avatarImageView.layer.masksToBounds = true
        
        return avatarImageView
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .preferredFont(forTextStyle: .body)
        nameLabel.textColor = .label
        nameLabel.numberOfLines = 1
        
        return nameLabel
    }()
    
    private let lastMessageLabel: UILabel = {
        let lastMessageLabel = UILabel()
        lastMessageLabel.font = .preferredFont(forTextStyle: .subheadline)
        lastMessageLabel.textColor = .secondaryLabel
        lastMessageLabel.numberOfLines = 1
        
        return lastMessageLabel
    }()
    
    private let lastMessageTimeLabel: UILabel = {
        let lastMessageTimeLabel = UILabel()
        lastMessageTimeLabel.font = .preferredFont(forTextStyle: .footnote)
        lastMessageTimeLabel.textColor = .secondaryLabel
        lastMessageTimeLabel.textAlignment = .right
        lastMessageTimeLabel.numberOfLines = 1
        
        return lastMessageTimeLabel
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIView Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarImageView.applyAttributesToFrame(
            FrameBuilder()
                .width(48)
                .height(48)
                .centerYToCenterY(ofView: contentView)
                .leading(equalTo: .leading, ofView: contentView, withOffset: 12)
                .build()
        )
        
        lastMessageTimeLabel.applyAttributesToFrame(
            FrameBuilder()
                .width(72)
                .height(18)
                .top(equalTo: .top, ofView: contentView, withOffset: 16)
                .trailing(equalTo: .trailing, ofView: contentView, withOffset: 12)
                .build()
        )
        
        nameLabel.applyAttributesToFrame(
            FrameBuilder()
                .width(from: .trailing, ofView: avatarImageView, withOffset: 12, to: .leading, ofView: lastMessageTimeLabel)
                .height(18)
                .top(equalTo: .top, ofView: contentView, withOffset: 16)
                .leading(equalTo: .trailing, ofView: avatarImageView, withOffset: 12)
                .build()
        )
        
        lastMessageLabel.applyAttributesToFrame(
            FrameBuilder()
                .width(from: .trailing, ofView: avatarImageView, withOffset: 12, to: .trailing, ofView: contentView, withOffset: 12)
                .height(20)
                .top(equalTo: .bottom, ofView: nameLabel, withOffset: 2)
                .leading(equalTo: .trailing, ofView: avatarImageView, withOffset: 12)
                .build()
        )
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        avatarImageView.image = nil
        nameLabel.text = nil
        lastMessageLabel.text = nil
        lastMessageTimeLabel.text = nil
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(lastMessageLabel)
        contentView.addSubview(lastMessageTimeLabel)
    }
    
    // MARK: - Configuration Methods
    
    func configure(with configuration: Configuration) {
        configureAvatarImageView(with: configuration.avatarUrl)
        configureNameLabel(with: configuration.name)
        configureLastMessageLabel(with: configuration.lastMessage)
        configureLastMessageTimeLabel(with: configuration.lastMessageTime)
    }
    
    private func configureAvatarImageView(with avatarUrl: String?) {
        if let avatarUrl, let url = URL(string: avatarUrl) {
            DispatchQueue.global(qos: .userInitiated).async {
                if let data = try? Data(contentsOf: url) {
                    let image = UIImage(data: data)
                    
                    DispatchQueue.main.async { [weak self] in
                        self?.avatarImageView.image = image
                    }
                }
            }
        }
    }
    
    private func configureNameLabel(with name: String) {
        nameLabel.text = name
    }
    
    private func configureLastMessageLabel(with lastMessage: String?) {
        if let lastMessage {
            lastMessageLabel.text = lastMessage
            lastMessageLabel.textColor = .secondaryLabel
        } else {
            lastMessageLabel.text = "Be the first to write..."
            lastMessageLabel.textColor = .tertiaryLabel
        }
    }
    
    private func configureLastMessageTimeLabel(with lastMessageTime: Date?) {
        guard let lastMessageTime else { return }
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        
        lastMessageTimeLabel.text = formatter.string(from: lastMessageTime)
    }
    
}

// MARK: - Configuration

extension MessengerDialogCell {
    
    struct Configuration {
        let avatarUrl: String?
        let name: String
        let lastMessage: String?
        let lastMessageTime: Date?
    }
    
}
