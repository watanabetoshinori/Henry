//
//  Console.swift
//  Console
//
//  Created by Watanabe Toshinori on 12/31/17.
//

import UIKit

protocol ConsoleDelegate: class {

    func consoleDidUpdateLog(_ console: Console)

    func consoleDidClearLogs(_ console: Console)

}

class Console: NSObject {

    weak var delegate: ConsoleDelegate?

    var logs = ""

    private var inputPipe: Pipe?

    private var outputPipe: Pipe?

    private var isEnabled = false

    // MARK: - Initializing a Singleton

    static let current = Console()

    override private init() {

    }

    // MARK: - Managing logs

    func output(_ log: String) {
        if log.isEmpty {
            return
        }

        logs += log

        delegate?.consoleDidUpdateLog(self)
    }

    func clear() {
        logs = ""

        delegate?.consoleDidClearLogs(self)
    }

    // MARK: - Managing Standard Output

    func enabled() {
        if inputPipe != nil {
            return
        }

        isEnabled = true

        inputPipe = Pipe()
        outputPipe = Pipe()

        // ouputPipe -> stdout
        dup2(STDOUT_FILENO, outputPipe!.fileHandleForWriting.fileDescriptor)

        // stdout/stderr -> inputPipe
        dup2(inputPipe!.fileHandleForWriting.fileDescriptor, STDOUT_FILENO)
        dup2(inputPipe!.fileHandleForWriting.fileDescriptor, STDERR_FILENO)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(Console.fileReadCompletion(notification:)),
                                               name: FileHandle.readCompletionNotification,
                                               object: inputPipe!.fileHandleForReading)

        inputPipe!.fileHandleForReading.readInBackgroundAndNotify()
    }

    func disabled() {
        isEnabled = false
    }

    @objc private func fileReadCompletion(notification: Notification) {
        guard let fileHandle = notification.object as? FileHandle,
            fileHandle == inputPipe!.fileHandleForReading else {
                return
        }

        inputPipe!.fileHandleForReading.readInBackgroundAndNotify()

        if let userInfo = notification.userInfo,
            let data = userInfo[NSFileHandleNotificationDataItem] as? Data,
            let log = String(data: data, encoding: .ascii) {

            // starndartInputPipe -> starndartOutputPipe
            outputPipe!.fileHandleForWriting.write(data)

            if isEnabled {
                DispatchQueue.main.async {
                    self.output(log)
                }
            }
        }
    }

}
