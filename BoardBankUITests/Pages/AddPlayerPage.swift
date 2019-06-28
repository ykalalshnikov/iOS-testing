//
//  AddPlayerPage.swift
//  BoardBankUITests
//
//  Created by Юрий Калашников on 25/06/2019.
//  Copyright © 2019 Richard Neitzke. All rights reserved.
//

import XCTest

class AddPlayerPage {
    
    // Creating app instance
    static let app = XCUIApplication()
    
    // Elements
    let saveButton = app.buttons["Save"].firstMatch
    let textFieldPlayer = app.textFields["Player"].firstMatch
    let textFieldBalance = app.textFields["1500"].firstMatch
    let addPlayerButton = app.staticTexts["Add Player"].firstMatch
    let tableIcons = app.tables.cells.collectionViews.otherElements
    let cancelButton = app.buttons["Cancel"]
    
    
    func fillName(name: String) {
        /**
         
         */
        textFieldPlayer.typeText(name)
    }
    
    func fillBalance(balance: String) {
        /**
         
         */
        textFieldBalance.typeText(balance)
    }
    
    func addPlayer() {
        /**
         
         */
        addPlayerButton.tap()
    }
    
    func setPlayerImageWith(image: String)  {
        /**
         
         */
        let imageSelectorLocator = tableIcons.containing(.image, identifier:image).element
        imageSelectorLocator.tap()
    }
    
    func cancelOnAddplayerPage() {
        /**
         
         */
        cancelButton.tap()
    }
}
