//
//  PomodoroModel.swift
//  Pomodoro Timer
//
//  Created by Jay Bergonia on 5/15/22.
//

import Foundation
import SwiftUI

class PomodoroModel: NSObject, ObservableObject {
    // MARK: Timer Properties
    @Published var progress: CGFloat = 1
    @Published var timerStringValue: String = "00:00"
    
    @Published var hour: Int = 0
    @Published var minutes: Int = 0
    @Published var seconds: Int = 0
    
}
