//
//  TestView.swift
//  LearningApp
//
//  Created by Braydon Whitfield on 2021-07-18.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var selectedAnswerIndex: Int?
    @State var numCorrect = 0
    @State var submitted = false
    @State var showResults = false
    
    var body: some View {
        
        if model.currentQuestion != nil && showResults == false {
            
            VStack {
                //Question Number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
                
                //Question
                CodeTextView()
                    .padding(.horizontal, 20)
                
                //Answers
                ScrollView {
                    
                    VStack {
                        
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self) { index in
                            
                            Button(action: {
                                //Track the selected index
                                selectedAnswerIndex = index
                            }, label: {
                                ZStack {
                                    if submitted == false {
                                        RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                            .frame(height: 48)
                                    } else {
                                        //Answer has been submitted
                                        if index == selectedAnswerIndex && index == model.currentQuestion!.correctIndex {
                                            
                                            //User has selected the correct answer
                                            //Show a green background
                                            RectangleCard(color: .green)
                                                .frame(height: 48)
                                        } else if index == selectedAnswerIndex && index != model.currentQuestion!.correctIndex {
                                            
                                            //User has selected the wrong answer
                                            //Show a red background
                                            RectangleCard(color: .red)
                                                .frame(height: 48)
                                        } else if index == model.currentQuestion!.correctIndex {
                                            
                                            //This button is the correct answer
                                            //Show a green background
                                            RectangleCard(color: .green)
                                                .frame(height: 48)
                                        } else {
                                            RectangleCard(color: .white)
                                                .frame(height: 48)
                                        }
                                    }
                                    Text(model.currentQuestion!.answers[index])
                                }
                            })
                        .disabled(submitted)
                    }
                }
                .accentColor(.black)
                .padding()
            }
            
                //Submit Button
                Button(action: {
                    
                    //Check if answer has been submitted
                    if submitted == true {
                        
                        //Check if its the last question
                        if model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count {
                            
                            //Check next question and save progress
                            model.nextQuestion()
                            
                            //Show the results
                            showResults = true
                        } else {
                            
                            //Answer has already been submitted, move to next question, and save progress
                            model.nextQuestion()
                            
                            //Reset properties
                            submitted = false
                            selectedAnswerIndex = nil
                        }

                    } else {
                        
                        //Change submitted state to true
                        submitted = true
                        
                        //Check the answer, and increment the counter if correct
                        if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                            numCorrect += 1
                        }
                    }
                }, label: {
                    ZStack {
                            RectangleCard(color: .green)
                                .frame(height: 48)
                
                            Text("\(buttonText)")
                                .bold()
                                .foregroundColor(.white)
                    }
                    .padding()
                })
                .disabled(selectedAnswerIndex == nil)
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
        } else if showResults == true {
            
            //If current question is nil, we show the result view
            TestResultView(numCorrect: numCorrect)
        } else {
            ProgressView()
        }
    }
    
    var buttonText: String {
        
        //Check if answer has been submitted
        if submitted == true {
            if model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count {
                return "Finish"
            } else {
                return "Next"
            }
        } else {
            return "Submit"
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
