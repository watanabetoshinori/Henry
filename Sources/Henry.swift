//
//  Henry.swift
//  Henry
//
//  Created by Toshinori Watanabe on 12/31/17.
//  Copyright © 2017 Toshinori Watanabe. All rights reserved.
//

import Foundation

public class Henry: NSObject {

    lazy private var window: Window = {
        let viewController = UIViewController()
        viewController.view.frame = UIScreen.main.bounds
        viewController.view.backgroundColor = .clear

        let window = Window(frame: UIScreen.main.bounds)
        window.rootViewController = viewController
        return window
    }()

    // MARK: - Initializing a Singleton

    static private let main = Henry()

    override private init() {

    }

    // MARK: - Show / Hide Panel

    @objc public class func show() {
        if Henry.main.window.isHidden == false {
            return
        }

        Henry.main.window.isHidden = false

        let bundle = Bundle(for: Henry.self)
        let storyboard = UIStoryboard(name: "Console", bundle: bundle)

        if let rootViewController = Henry.main.window.rootViewController,
            let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController {

            navigationController.topViewController?.title = "Henry"
            navigationController.topViewController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close",
                                                                                                        style: .plain,
                                                                                                        target: Henry.self,
                                                                                                        action: #selector(Henry.hide))

            if rootViewController.traitCollection.horizontalSizeClass == .regular,
                rootViewController.traitCollection.verticalSizeClass == .regular {

                navigationController.modalPresentationStyle = .popover
                navigationController.preferredContentSize = CGSize(width: 320, height: 480)
                navigationController.popoverPresentationController?.delegate = Henry.main.window as! UIPopoverPresentationControllerDelegate
                navigationController.popoverPresentationController?.sourceView = rootViewController.view
                navigationController.popoverPresentationController?.sourceRect = CGRect(origin: CGPoint(x: rootViewController.view.frame.size.width / 2, y: 0),
                                                                                        size: .zero)
                navigationController.popoverPresentationController?.permittedArrowDirections = .any
            }

            Henry.main.window.rootViewController?.present(navigationController, animated: true, completion: nil)
        }
    }

    @objc public class func hide() {
        if Henry.main.window.isHidden {
            return
        }

        Henry.main.window.rootViewController?.dismiss(animated: true, completion: {
            Henry.main.window.isHidden = true
        })
    }

    public class func enabled() {
        Console.current.enabled()
    }

}
