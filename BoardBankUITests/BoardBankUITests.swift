//
//  BoardBankUITests.swift
//  BoardBankUITests
//
//  Created by Юрий Калашников on 25/06/2019.
//  Copyright © 2019 Richard Neitzke. All rights reserved.
//

import XCTest

class BoardBankUITests: XCTestCase {
    
    
    // Page Objects intialization
    let addPlayerPage = AddPlayerPage()
    let mainPage = MainPage()
    let settingPage = SettingsPage()
    
    // Test Data variables
    let player1Name = "PlayerName1"
    let player1NewName = "newPlayerName1"
    let player2Name = "PlayerName2"
    let defaultPlayerBalance = "1.500"
    let playerBalanceAfterAdd = "1.700"
    let player1BalanceAfterTransfer = "1200"
    let player2BalanceAfterTransfer = "1800"
    let defaultCurrency = "$"
    let transferSum = "300"
    
    
    
    override func setUp() {
        super.setUp()
        
        // stop immediately when a failure occurs.
        continueAfterFailure = false
        // launch the app
        XCUIApplication().launch()
        
        //
        mainPage.openSettings()
        settingPage.newGame()
    }
    
    override func tearDown() {
        super.tearDown()
        
        // close the app
        XCUIApplication().terminate()
    }
    
    // Tests
    
    func testAddPlayer() {
        /**
         
         */
        mainPage.openAddPlayer()
        addPlayerPage.fillName(name: player1Name)
        addPlayerPage.addPlayer()
        let isPlayerExist = mainPage.isPlayerExist(name: player1Name, balance: defaultPlayerBalance, currency: defaultCurrency)
        XCTAssertTrue(isPlayerExist, "Player does not exist")
    }
    
    func testRenamePlayer() {
        /**
         
         */
        mainPage.openAddPlayer()
        addPlayerPage.fillName(name: player1Name)
        addPlayerPage.addPlayer()
        mainPage.selectPlayer(playerName: player1Name)
        mainPage.actionOnPlayer(action: "rename", name: player1NewName)
        let isRenamedPlayerExist = mainPage.isPlayerExist(name: player1NewName, balance: defaultPlayerBalance, currency: defaultCurrency)
        XCTAssertTrue(isRenamedPlayerExist, "Renamed player does not exist")
    }
    
    func testAddMoney() {
        /**
         
         */
        mainPage.openAddPlayer()
        addPlayerPage.fillName(name: player1Name)
        addPlayerPage.addPlayer()
        mainPage.selectPlayer(playerName: player1Name)
        mainPage.actionOnPlayer(action: "add")
        let isPlayerWithAddedMoneyExist = mainPage.isPlayerExist(name: player1Name, balance: playerBalanceAfterAdd, currency: defaultCurrency)
        XCTAssertTrue(isPlayerWithAddedMoneyExist, "Player with added money does not exist")
    }
    
    func testDeletePlayer() {
        /**
         
         */
        mainPage.openAddPlayer()
        addPlayerPage.fillName(name: player1Name)
        addPlayerPage.addPlayer()
        mainPage.selectPlayer(playerName: player1Name)
        mainPage.actionOnPlayer(action: "delete")
        let deletedPlayer = mainPage.isPlayerExist(name: player1Name, balance: playerBalanceAfterAdd, currency: defaultCurrency)
        XCTAssertFalse(deletedPlayer, "Deleted player exist")
    }
    
    func testReplacePlayers() {
        /**
         
         */
        mainPage.openAddPlayer()
        addPlayerPage.fillName(name: player1Name)
        addPlayerPage.addPlayer()
        mainPage.openAddPlayer()
        addPlayerPage.fillName(name: player2Name)
        addPlayerPage.addPlayer()
        let positionPlayer1Before = mainPage.returnPlayerPosition(name: player1Name)
        let positionPlayer2Before = mainPage.returnPlayerPosition(name: player2Name)
        mainPage.replacePlayers(playerOneName: player1Name, playerTwoName: player2Name)
        let positionPlayer1After = mainPage.returnPlayerPosition(name: player1Name)
        let positionPlayer2After = mainPage.returnPlayerPosition(name: player2Name)
        XCTAssertTrue(positionPlayer1After == positionPlayer2Before, "Player1 does not replaced with Player2")
        XCTAssertTrue(positionPlayer2After == positionPlayer1Before, "Player2 does not replaced with Player1")
    }
    
    func testTransferMoney() {
        /**
         
         */
        mainPage.openAddPlayer()
        addPlayerPage.fillName(name: player1Name)
        addPlayerPage.addPlayer()
        mainPage.openAddPlayer()
        addPlayerPage.fillName(name: player2Name)
        addPlayerPage.addPlayer()
        mainPage.transferMoney(playerOneName: player1Name, playerTwoName: player2Name, sum: transferSum )
        let player1 = mainPage.isPlayerExist(name: player1Name, balance: player1BalanceAfterTransfer, currency: defaultCurrency)
        XCTAssertTrue(player1, "Player1 money do not transfered")
        let player2 = mainPage.isPlayerExist(name: player2Name, balance: player2BalanceAfterTransfer, currency: defaultCurrency)
        XCTAssertTrue(player2, "Player2 money do not transfered")
    }
    
    func testMaxPlayers() {
        /**
         
         */
        for _ in (1...6) {
            mainPage.openAddPlayer()
            addPlayerPage.addPlayer()}
        let addPlayerButton = XCUIApplication().buttons["Add"].firstMatch
        XCTAssertFalse(addPlayerButton.isEnabled, "Add Player button is enabled")
    }
    
    func testNavigationToMainPageFromSettingsPage() {
        /**
         
         */
        mainPage.openSettings()
        settingPage.cancelOnSettingsPage()
        let isMainPage = mainPage.isMainPageExist()
        XCTAssertTrue(isMainPage, "Main Page do not opened")
    }
    
    func testNavigationToMainPageFromAddPLayerPage() {
        /**
         
         */
        mainPage.openAddPlayer()
        addPlayerPage.cancelOnAddplayerPage()
        let isMainPage = mainPage.isMainPageExist()
        XCTAssertTrue(isMainPage, "Main Page do not opened")
    }
    
}
