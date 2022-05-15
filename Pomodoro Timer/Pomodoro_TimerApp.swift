//
//  Pomodoro_TimerApp.swift
//  Pomodoro Timer
//
//  Created by Jay Bergonia on 5/15/22.
//

import SwiftUI

@main
struct Pomodoro_TimerApp: App {
    
    // MARK: Since We're doing Background fetching Initialize here
    @StateObject var pomodoroModel: PomodoroModel = .init()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(pomodoroModel)
        }
    }
}
