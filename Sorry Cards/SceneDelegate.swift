//
//  SceneDelegate.swift
//  Sorry Cards
//
//  Created by Blake on 4/12/20.
//  Copyright © 2020 Keeper. All rights reserved.
//

import UIKit
import SwiftUI
import AVFoundation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        var deck = [String]()
        let values =  ["One", "Two", "Three", "Four", "Five", "Seven", "Eight", "Ten", "Eleven", "Twelve", "Sorry"]
        for value in values {
            var i = 4
            if value == "One" { i = 5 }
            while i > 0 {
                deck.append(value)
                  i -= 1
            }
        }
        deck.shuffle()
        var shuffleSound: AVAudioPlayer?
        let path = Bundle.main.path(forResource: "Shuffle.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        //let url = Bundle.main.url(forResource: "Shuffle", withExtension: "mp3")

        do {
            shuffleSound = try AVAudioPlayer(contentsOf: url)
            shuffleSound?.play()
        } catch {
            // couldn't load file :(
        }
        
        var cardFlip: AVAudioPlayer?
        let path2 = Bundle.main.path(forResource: "Flip.mp3", ofType:nil)!
        let url2 = URL(fileURLWithPath: path2)
        //let url = Bundle.main.url(forResource: "Shuffle", withExtension: "mp3")

        do {
            cardFlip = try AVAudioPlayer(contentsOf: url2)

        } catch {
            // couldn't load file :(
        }
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView(deck: deck, shuffleSound: shuffleSound ?? AVAudioPlayer(), cardFlip: cardFlip ?? AVAudioPlayer() )
        

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

