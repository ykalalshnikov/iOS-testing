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
         
         */
        let isTitleAndStubExists =  (title.exists) && (textStub.exists)
        return isTitleAndStubExists
    }
    
    
    func openSettings() {
        /**
         
         */
        settingsButton.tap()
    }
    
    func openAddPlayer() {
        /**
         
         */
        addPlayerButton.tap()
    }
    
    func isPlayerExist(name: String, balance: String, currency: String) -> Bool {
        /**
         
         */
        let player = collectionViews.containing(.staticText, identifier:name).staticTexts["\(currency)\(balance)"]
        
        return (player.exists)
    }
    
    func replacePlayers(playerOneName: String, playerTwoName: String){
        /**
         
         */
        let playerOne = app.staticTexts[playerOneName]
        let playerTwo = app.staticTexts[playerTwoName]
        
        playerOne.press(forDuration: 2.0, thenDragTo: playerTwo)
    }
    
    func transferMoney(playerOneName: String, playerTwoName: String, sum: String) {
        /**
         
         */
        let playerOne = app.staticTexts[playerOneName]
        let playerTwo = app.staticTexts[playerTwoName]
        
        playerOne.press(forDuration: 0.2, thenDragTo: playerTwo)
        transferSumTextField.typeText(sum)
        transferOkButton.tap()
    }
    
    func selectPlayer(playerName: String) {
        /**
         
         */
        let player = app.staticTexts[playerName].firstMatch
        player.tap()
    }
    
    func actionOnPlayer(action: String, name: String="") {
        /**
         
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
         
         */
        let player = app.staticTexts[name]
        let position = player.frame
        return position
    }
    
}
