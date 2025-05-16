//
//  AlertViewController.swift
//  shichimi
//
//  Created by Shichimitoucarashi on 2018/07/22.
//  Copyright © 2018年 keisuke yamagishi. All rights reserved.
//

import UIKit

protocol AlertViewControllerDelegate: AnyObject {
    func didTapOkButton()
    func didTapCancelButton()
}

final class AlertViewController: UIViewController {
    // MARK: Property

    weak var delegate: AlertViewControllerDelegate?

    var text: String? {
        didSet {
            titleLabel.text = text
        }
    }

    var descreption: String? {
        didSet {
            descriptionLabel.text = descreption
        }
    }

    // MARK: Private Property

    @IBOutlet private var effectView: UIVisualEffectView!
    @IBOutlet private var baseView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var okButton: UIButton!
    @IBOutlet private var cancelButton: UIButton!
    @IBOutlet private var backgroundView: UIVisualEffectView!

    override func loadView() {
        super.loadView()
        setup()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        effectView
            .layer
            .boundAndFadeIn {}
        UIView
            .animate(withDuration: 0.2) { [self] in
                backgroundView.alpha = 0.5
            }
    }

    @IBAction func didTapOkButton(_: Any) {
        delegate?.didTapOkButton()
        effectView
            .gravity { [self] in
                dismiss(animated: false)
            }
    }

    @IBAction func didTapCancelButrton(_: Any) {
        delegate?.didTapCancelButton()
        effectView
            .gravity { [self] in
                dismiss(animated: false)
            }
    }

    private func setup() {
        view.backgroundColor = .clear
        backgroundView.alpha = 0.0
        okButton.addBorder(width: 0.7,
                           color: UIColor.lightGray.withAlphaComponent(0.5),
                           position: .top)
        okButton.addBorder(width: 0.7,
                           color: UIColor.lightGray.withAlphaComponent(0.5),
                           position: .right)
        cancelButton.addBorder(width: 0.7,
                               color: UIColor.lightGray.withAlphaComponent(0.5),
                               position: .top)
        effectView.layer.cornerRadius = 17
        effectView.layer.masksToBounds = true
        baseView.layer.cornerRadius = 17
        baseView.layer.masksToBounds = true
    }
}
