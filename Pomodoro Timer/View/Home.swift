//
//  Home.swift
//  Pomodoro Timer
//
//  Created by Jay Bergonia on 5/15/22.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var pomodorModel: PomodoroModel
    
    var body: some View {
        VStack{
            Text("Pomodoro Timer")
                .font(.title2.bold())
                .foregroundColor(.white)
            
            GeometryReader{proxy in
                VStack(spacing: 15){
                    // MARK: Timer Ring
                    ZStack{
                        Circle()
                            .fill(.white.opacity(0.03))
                            .padding(-40)
                        
                        Circle()
                            .trim(from: 0, to: pomodorModel.progress)
                            .stroke(.white.opacity(0.03), lineWidth: 80)
                        
                        Circle()
                            .fill(Color("BG"))
                        
                        Circle()
                            .trim(from: 0, to: 0.5)
                            .stroke(Color("Purple").opacity(0.7), lineWidth: 10)
                        
                        // MARK: Shadow
                        Circle()
                            .trim(from: 0, to: 0.5)
                            .stroke(Color("Purple").opacity(0.7), lineWidth: 5)
                            .blur(radius: 15)
                            .padding(-2)
                        
                        // MARK: KNOB
                        GeometryReader{proxy in
                            let size = proxy.size
                            
                            Circle()
                                .fill(Color("Purple"))
                                .frame(width: 30, height: 30)
                                .overlay(content: {
                                    Circle()
                                        .fill(.white)
                                        .padding(5)
                                })
                                .frame(width: size.width, height: size.height, alignment: .center)
                            // MARK: Since View is Rotated That's Why using X
                                .offset(x: -size.height / 2)
                                .rotationEffect(.init(degrees: pomodorModel.progress * 360))
                            
                        }
                        
                        Text(pomodorModel.timerStringValue)
                            .font(.system(size: 45, weight: .light))
                            .rotationEffect(.init(degrees:  -90))
                            .animation(.none, value: pomodorModel.progress)
                        
                    }
                    .padding(60)
                    .frame(height: proxy.size.width)
                    .rotationEffect(.init(degrees: -90))
                    .animation(.easeOut, value: pomodorModel.progress)
                    
                    Button {
                        if pomodorModel.isStarted {
                            
                        } else {
                            pomodorModel.addNewTimer = true
                        }
                        
                    } label: {
                        Image(systemName: !pomodorModel.isStarted ? "timer" : "pause")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80)
                            .background {
                                Circle()
                                    .fill(Color("Purple"))
                            }
                            .shadow(color: Color("Purple"), radius: 0, x: 0, y: 0)
                    }

                }
                .onTapGesture(perform: {
                    pomodorModel.progress = 0.5
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
        .padding()
        .background{
            Color("BG")
                .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
        
        
        //
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PomodoroModel())
    }
}
