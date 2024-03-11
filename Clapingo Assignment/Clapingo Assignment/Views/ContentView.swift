//
//  ContentView.swift
//  Clapingo Assignment
//
//  Created by Palak Satti on 08/03/24.
//
import SwiftUI

struct ContentView: View {
    @State private var showHalfModal = false
    @State private var viewState = CGSize.zero
    @StateObject private var viewModel = WordOfTheDayViewModel()

    var body: some View {
        ZStack {
            
            ScrollView {
                VStack {
                    HStack(alignment: .center, spacing: 80) {
                        VStack(alignment: .leading) {
                            Text("Thursday, March 21, 2021")
                            Text("Morning Student, ")
                        }
                        .font(.custom("Poppins Bold", size: 20))
                      
                        Image(systemName: "wallet.pass")
                            .font(.system(size: 35))
                    }
    
                    // Word of the day
                    RoundedRectangle(cornerSize: CGSize(width: 10.0, height: 20.0))
                        .fill(LinearGradient(gradient: Gradient(colors: [.g, .g1]), startPoint: .leading, endPoint: .trailing))
                                            .frame(width: 360, height: 160)
                                            .overlay(
                                                HStack {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        Text("Word of the day")
                                                        Text(viewModel.wordOfTheDay)
                                                            .font(.title)
                                                            .bold()
                                                        Text(viewModel.meaning)
                                                            .italic()
                                                    }
                                                    .foregroundColor(.white)
                                                    .padding()
                                                    Spacer()
                                                }
                                            )
                                            .onAppear(perform: viewModel.fetchWordOfTheDay)
                    
                    // Week1
                    Rectangle()
                        .fill(Color.pink)
                        .opacity(0.1)
                        .frame(width: .infinity, height: 70)
                        .overlay(
                            VStack {
                                Text("Week1: Your session 3 will expire in")
                                Text("6 days 14 hours")
                                    .bold()
                            }
                        )
                    
                    // Current Plan Section
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            VStack {
                                Text("Current Plan:")
                                    .font(.headline)
                                Text("3 days/week")
                                    .foregroundColor(.green)
                                    .bold()
                            }
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    showHalfModal = true
                                }
                            }) {
                                Text("View More")
                                    .font(.system(.headline))
                                    .foregroundColor(.green)
                            }
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Group {
                                VStack(alignment: .leading) {
                                    Text("Start Date:")
                                    Text("20/03/21")
                                }
                                Spacer()
                                VStack(alignment: .leading) {
                                    Text("End Date:")
                                    Text("20/04/21")
                                }
                            }
                            .font(.caption)
                        }
                        .padding(.horizontal)
                        
                        Divider().padding(.horizontal)

                        HStack {
                            Group {
                                VStack {
                                    Text("Sessions left:")
                                    Text("21")
                                        .bold()
                                }
                                Spacer()
                                VStack {
                                    Text("Total sessions:")
                                    Text("22")
                                        .bold()
                                }
                                Spacer()
                                VStack {
                                    Text("Backlog sessions:")
                                    Text("22")
                                        .bold()
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        // Replace with actual booking action
                        Button(action: {}) {
                            Text("Book a slot")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)

                    // Upcoming Session Section
                    VStack(spacing: 15) {
                        HStack {
                            Text("Upcoming session")
                                .font(.headline)
                            Spacer()
                            
                            Button(action: {}) {
                                Text("View all")
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.horizontal)

                        HStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.1))
                                .frame(height: 80)
                                .overlay(
                                    HStack {
                                      
                                        Image("pic")
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                            .clipShape(Circle())
                                        
                                 
                                        VStack(alignment: .leading) {
                                            Text("Session 1")
                                            Text("Date: 23/03/21")
                                            Text("Time: 23:00-23:25")
                                        }
                                        
                                        Spacer()
                                        
                                      
                                        VStack {
                                            Image(systemName: "note.text")
                                                .font(.system(size: 30))
                                        }
                                    }
                                    .padding(.horizontal)
                                )
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
            }
            .blur(radius: showHalfModal ? 10 : 0)

            // The half-screen modal view
            if showHalfModal {
               
                Rectangle()
                    .fill(Color.black.opacity(0.4))
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                       
                        withAnimation {
                            showHalfModal = false
                        }
                    }
                    .transition(.opacity)
                    .zIndex(1)

                // The Bottom Sheet View
                BottomSheetView()
                    .offset(y: viewState.height)
                    .transition(.move(edge: .bottom))
                    .gesture(
                        DragGesture().onChanged { value in
                            if value.translation.height > 0 {
                                viewState = value.translation
                            }
                        }
                        .onEnded { value in
                            if value.translation.height > 100 {
                                withAnimation {
                                    showHalfModal = false
                                }
                            }
                            viewState = .zero
                        }
                    )
                    .frame(height: UIScreen.main.bounds.height / 2)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding(.top, UIScreen.main.bounds.height / 2)
                    .zIndex(2)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .padding(.top)
        
    }
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

