//
//  ConsoleLogController.swift
//  Console
//
//  Created by Watanabe Toshinori on 12/31/17.
//  Copyright © 2017 Toshinori Watanabe. All rights reserved.
//

import UIKit

class ConsoleLogController: UIViewController, ConsoleDelegate {

    @IBOutlet weak var textView: UITextView!

    @IBOutlet var clearButton: UIBarButtonItem!

    @IBOutlet weak var toolBar: UIToolbar!

    private var isInitialized = false

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        Console.current.delegate = self

        textView.text = Console.current.logs

        updateClerButtonState()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if isInitialized == false {
            isInitialized = true

            // Scroll to bottom
            textView.scrollRangeToVisible(NSRange(location: textView.text.count - 1, length: 1))
        }
    }

    deinit {
        Console.current.delegate = nil
    }

    // MARK: - Actions

    @IBAction func clearTapped(_ sender: Any) {
        Console.current.clear()
    }

    // MARK: - Console Delegate

    func consoleDidUpdateLog(_ console: Console) {
        textView.text = console.logs

        // Scroll to bottom
        textView.scrollRangeToVisible(NSRange(location: textView.text.count - 1, length: 1))

        updateClerButtonState()
    }

    func consoleDidClearLogs(_ console: Console) {
        textView.text = ""

        updateClerButtonState()
    }

    // MARK: - Controls

    private func updateClerButtonState() {
        clearButton.isEnabled = !Console.current.logs.isEmpty
    }

}
