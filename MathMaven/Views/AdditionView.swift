//
//  AdditionView.swift
//  MathMaven
//
//  Created by Russell Gordon on 2023-05-24.
//

import SwiftUI

struct AdditionView: View {
    
    // MARK: Stored properties
    
    // The numbers to be added
    @State var firstValue = Int.random(in: 1...72)
    @State var secondValue = Int.random(in: 1...72)
    
    // Holds whatever input was provided by the user
    @State var input = ""
    
    // Has the user's answer been checked?
    @State var answerChecked = false
    
    // Was the user's given answer correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    
    // The correct response
    var correctResponse: Int {
        return firstValue + secondValue
    }
    
    // The user interface to show
    var body: some View {
        
        VStack(spacing: 0) {
            
            // 1. Present question
            Group {
                HStack {
                    Text(Operation.addition.rawValue)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("\(firstValue)")
                        Text("\(secondValue)")
                    }
                }
                
                Divider()
            }
            .padding(.horizontal)
            
            // 2. Accept answer
            HStack {
                
                ZStack {
                    
                    // Only show this when the answer was found to be correct
                    if answerCorrect == true {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.green)
                    }
                    
                    // Show this when the answer was checked and found to be false
                    if answerChecked == true && answerCorrect == false {
                        Image(systemName: "x.square")
                            .foregroundColor(.red)
                    }
                }
                
                Spacer()
                
                TextField("",
                          text: $input)
                .multilineTextAlignment(.trailing)
            }
            .padding(.horizontal)
        }
        // 3. Check answer
        //    Only show button when answer has not already been checked
        if answerChecked == false {
            
            CheckAnswerButtonView(input: input,
                                  correctResponse: correctResponse,
                                  answerChecked: $answerChecked,
                                  answerCorrect: $answerCorrect)
            
        } else {
            
            // 4. Generate new question
            // Only show this once an answer has been provided
            VStack{
                Button(action: {
                    generateNewQuestion()
                }, label: {
                    Text("New question")
                        .font(.largeTitle)
                })
                .padding()
                .buttonStyle(.bordered)
                
                if answerCorrect == true {
                    Text("Great Job!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.green)

                    List(favourites) { favourite in

                        NavigationLink(destination: {
                            LottieView(animationNamed: favourite.fileName)
                        }, label: {
                            
                        })

                    }
                }
                else {
                    Text("Nice Try!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.red)
                }
                // Push interface up to top of screen
                Spacer()
                
            }
            .font(Font.custom("SF Pro", size: 64))
        }
        
        
    }
    
    
    // MARK: Functions
    
    // Generate a new question
    func generateNewQuestion() {
        
        // Generate a new question
        firstValue = Int.random(in: 1...72)
        secondValue = Int.random(in: 1...72)
        
        // Reset properties that track what's happening with the current question
        answerChecked = false
        answerCorrect = false
        
        // Reset the input field
        input = ""
        
    }
    
}

struct AdditionView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionView()
    }
}
