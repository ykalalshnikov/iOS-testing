//
//  SettingsPage.swift
//  BoardBankUITests
//
//  Created by Юрий Калашников on 25/06/2019.
//  Copyright © 2019 Richard Neitzke. All rights reserved.
//

import XCTest

class SettingsPage {
    
    // Creating app instance
    let app = XCUIApplication()
    
    // Elements
    lazy var newGameButton = app.tables.staticTexts["New Game"]
    lazy var allertNewGameButton = app.alerts["Are you sure?"].buttons["New Game"]
    lazy var cancelButton = app.buttons["Cancel"]
    
    
    func newGame() {
        /**
         
         */
        newGameButton.tap()
        allertNewGameButton.tap()
    }
    
    func cancelOnSettingsPage() {
        /**
         
         */
        cancelButton.tap()
    }
    
}
