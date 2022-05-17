//
//  DateFormatter+.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation

extension DateFormatter {
    static let yearMonthDayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy."
        
        return formatter
    }()
}
