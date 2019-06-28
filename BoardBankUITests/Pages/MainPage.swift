//
//  MainPage.swift
//  BoardBankUITests
//
//  Created by Юрий Калашников on 25/06/2019.
//  Copyright © 2019 Richard Neitzke. All rights reserved.
//

import XCTest

class MainPage {
    
    // Creating app instance
    let app = XCUIApplication()
    
    // Elements
    lazy var collectionViews = app.collectionViews.cells.otherElements
    lazy var addPlayerButton = app.buttons["Add"].firstMatch
    lazy var settingsButton = app.navigationBars["BoardBank"].buttons.firstMatch
    lazy var textSum = app.staticTexts["$"]
    lazy var addButton = app.buttons["Add $200"]
    lazy var renameButton = app.buttons["Rename"]
    lazy var deleteButton = app.buttons["Delete"]
    lazy var cancelButton = app.buttons["Cancel"]
    lazy var renameOkButton = app.alerts["Rename Player"].buttons["OK"]
    lazy var renameTextField = app.alerts["Rename Player"].textFields.firstMatch
    lazy var transferOkButton = app.alerts["Transfer Money"].buttons["OK"]
    lazy var transferSumTextField = app.alerts["Transfer Money"].textFields.firstMatch
    lazy var title = app.navigationBars["BoardBank"].otherElements["BoardBank"]
    lazy var textStub = app.staticTexts["TAP + TO ADD A PLAYER\n\nTAP A PLAYER TO EDIT\n\nDRAG BETWEEN PLAYERS\nTO TRANSFER MONEY\n\nLONG PRESS PLAYERS\nTO REARRANGE"]
    lazy var board = app.collectionViews.staticTexts["BoarBank"]
    
    
    func isMainPageExist() -> Bool {
        /**
         Check that Main Page titles exists
         */
        let isTitleAndStubExists =  (title.exists) && (textStub.exists)
        return isTitleAndStubExists
    }
    
    
    func openSettings() {
        /**
         Tap on settings button
         */
        settingsButton.tap()
    }
    
    func openAddPlayer() {
        /**
         Tap on add player button
         */
        addPlayerButton.tap()
    }
    
    func isPlayerExist(name: String, balance: String, currency: String) -> Bool {
        /**
         Check that plyer with given params(name, balance, currency) exists
         */
        let player = collectionViews.containing(.staticText, identifier:name).staticTexts["\(currency)\(balance)"]
        
        return (player.exists)
    }
    
    func replacePlayers(playerOneName: String, playerTwoName: String){
        /**
         Replace players on the screen
         */
        let playerOne = app.staticTexts[playerOneName]
        let playerTwo = app.staticTexts[playerTwoName]
        
        playerOne.press(forDuration: 2.0, thenDragTo: playerTwo)
    }
    
    func transferMoney(playerOneName: String, playerTwoName: String, sum: String) {
        /**
         Transfer money from one player to another
         */
        let playerOne = app.staticTexts[playerOneName]
        let playerTwo = app.staticTexts[playerTwoName]
        
        playerOne.press(forDuration: 0.2, thenDragTo: playerTwo)
        transferSumTextField.typeText(sum)
        transferOkButton.tap()
    }
    
    func selectPlayer(playerName: String) {
        /**
         Tap on player for next actions
         */
        let player = app.staticTexts[playerName].firstMatch
        player.tap()
    }
    
    func actionOnPlayer(action: String, name: String="") {
        /**
         Actions on player(delete, rename, add money)
         */
        if action == "delete" {
            deleteButton.tap()}
        if action == "rename" {
            renameButton.tap()
            renameTextField.typeText(name)
            renameOkButton.tap()}
        if action == "cancel" {
            cancelButton.tap()}
        if action == "add"    {
            addButton.tap()   }
    }
    
    func returnPlayerPosition (name: String) -> CGRect  {
        /**
         Get player position on the screen
         */
        let player = app.staticTexts[name]
        let position = player.frame
        return position
    }
    
}
