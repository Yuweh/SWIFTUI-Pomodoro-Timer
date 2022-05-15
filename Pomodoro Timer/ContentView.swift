//
//  ContentView.swift
//  Pomodoro Timer
//
//  Created by Jay Bergonia on 5/15/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var pomodorModel: PomodoroModel
    
    var body: some View {
        Home().environmentObject(pomodorModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
