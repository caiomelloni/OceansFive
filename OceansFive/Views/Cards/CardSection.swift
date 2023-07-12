//
//  CardSection.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 09/07/23.
//

import Foundation
import UIKit

protocol CardsSectionViewDelegate: AnyObject {
    func shouldRefreshData() async
}

class CardsSectionView: UIView {
    
    weak var delegate: CardsSectionViewDelegate?
    
    var cards:[UIView] = []
    
    init(cards:[UIView], delegate: CardsSectionViewDelegate?) {
        super.init(frame: .zero)
        self.cards = cards
        self.delegate = delegate
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        buildLayout()
    }
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private func buildLayout() {
        addSubview(scrollView)
        scrollView.addSubview(scrollStackViewContainer)
        configureRefreshControl()
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        configureContainerView()
        
    }
    
    private func configureContainerView() {
        for card in cards {
            scrollStackViewContainer.addArrangedSubview(card)
        }
    }
    
    func configureRefreshControl () {
        scrollView.refreshControl = UIRefreshControl()
        scrollView.refreshControl?.addTarget(self, action:
                                                #selector(handleRefreshControl),
                                             for: .valueChanged)
    }
    
    @objc func handleRefreshControl() {
        
        Task {
            await self.delegate?.shouldRefreshData()
        }
        
        self.scrollView.refreshControl?.endRefreshing()
    }
}
