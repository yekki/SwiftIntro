//
//  GameOverVC.swift
//  SwiftIntro
//
//  Created by Alexander Georgii-Hemming Cyon on 18/06/16.
//  Copyright © 2016 SwiftIntro. All rights reserved.
//

import UIKit

class GameOverVC: UIViewController, Configurable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var tryHarderLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var quitButton: UIButton!

    var config: GameConfiguration!
    var result: GameResult!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    override func prepare(for segue: UIStoryboardSegue?, sender: Any?) {
        guard var configurable = segue?.destination as? Configurable else { return }
        configurable.config = config
        guard let gameVC = segue?.destination as? GameVC else { return }
        guard var cards = result.cards else { return }
        cards.unflip()
        cards.unmatch()
        cards.memoryCards.shuffle()
        gameVC.cards = cards
    }
}

//MARK: Private Methods
private extension GameOverVC {
    func setupViews() {
        quitButton.layer.cornerRadius = quitButton.frame.height/2
        restartButton.layer.cornerRadius = restartButton.frame.height/2
        setupLocalizedText()
    }

    func setupLocalizedText() {
        titleLabel.setLocalizedText(.gameOverTitle)
        subtitleLabel.setLocalizedText(.gameOverSubtitle)
        scoreLabel.setLocalizedText(.clickScore(result.clickCount))
        tryHarderLabel.setLocalizedText(.tryHarder)
        restartButton.setLocalizedTitle(.restart)
        quitButton.setLocalizedTitle(.quit)
    }
}
