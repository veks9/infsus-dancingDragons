//
//  UITableView+.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import UIKit

public extension UITableView {
    /// Register a UITableViewCell for reuse with the class name as the reuse identifier
    ///
    /// - Parameter _: The class to be registered
    func registerCell<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: T.self))
    }

    /// Register a UITableViewHeader for reuse with the class name as the reuse identifier
    ///
    /// - Parameter _: The class to be registered
    func registerHeader<T: UITableViewHeaderFooterView>(_: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: String(describing: T.self))
    }

    /// Dequeue a reusable cell with the class name as the reuse identifier
    ///
    /// - Parameter indexPath: The `indexPath` to dequeue the cell for
    /// - Returns: The dequeued cell
    func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: T.self))")
        }

        return cell
    }

    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>() -> T {
        guard let headerFooter = dequeueReusableHeaderFooterView(withIdentifier: String(describing: T.self)) as? T else {
            fatalError("Could not dequeue headerFooter with identifier: \(String(describing: T.self))")
        }

        return headerFooter
    }

    /// Hide the cells not returned from the UITableViewDataSource.
    func hideTrailingCells() {
        tableFooterView = UIView()
    }
}

extension UITableView {
    func dequeueCellAtIndexPath<T: UITableViewCell>(indexPath: IndexPath) -> T {
        if let cell = dequeueReusableCell(withIdentifier: T.identity, for: indexPath) as? T {
            return cell
        } else {
            fatalError("cell with \"\(T.identity)\" identifier is not registered!")
        }
    }
}
