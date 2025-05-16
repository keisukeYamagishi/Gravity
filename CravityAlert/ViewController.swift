//
//  ViewController.swift
//  CravityAlert
//
//  Created by keisuke yamagishi on 2025/05/16.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentAlert()
    }

    @IBAction func didTapButton(_: Any) {
        presentAlert()
    }

    private func presentAlert() {
        let st = UIStoryboard(name: "Alert", bundle: nil)
        guard let alert = st.instantiateInitialViewController() as? AlertViewController else { return }
        alert.modalPresentationStyle = .overFullScreen
        present(alert, animated: false)
        alert.text = "Hello World"
        alert.descreption = "This is a test message."
    }
}
