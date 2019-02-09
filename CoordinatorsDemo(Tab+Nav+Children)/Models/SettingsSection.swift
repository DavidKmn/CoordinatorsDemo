//
//  SettingsSection.swift
//  CoordinatorsDemo(Tab+Nav+Children)
//
//  Created by David on 09/02/2019.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

enum SettingsSection: Int, CaseIterable {
    case mediaAccounts = 0
    case personalInfo
    case signOut
    
    var title: String {
        switch self {
        case .personalInfo:
            return "Personal Info"
        case .signOut:
            return "Login Out"
        case .mediaAccounts:
            return "Linked Media"
        }
    }
    
    var rows: [SettingsRow] {
        switch self {
        case .personalInfo:
            return [.firstName, .lastName, .email, .password]
        case .mediaAccounts:
            return [.twitter, .facebook]
        case .signOut:
            return [.signOut]
        }
    }
    
    static var allRows: [SettingsRow] {
        return SettingsSection.allCases.flatMap { $0.rows }
    }
    
    static func tag(for row: SettingsRow) -> Int {
        return allRows.firstIndex(of: row)!
    }
    
    static func row(for tag: Int) -> SettingsRow {
        return allRows[tag]
    }
}
