//
//  ContentView.swift
//  CrossDotProductCalculator
//
//  Created by ALVIN WEI on 9/2/26.
//
import SwiftUI
struct ContentView: View {
    @State var vect = [1,2,3]
    @State var x1 = "0"
    @State var y1 = "0"
    @State var z1 = "0"
    @State var x2 = "0"
    @State var y2 = "0"
    @State var z2 = "0"
    @State var answerDot = 0.0
    @State var answerCross = [0.0,0.0,0.0]
    @State var showAlert = false
    @State var canNavigate = false
    @State var areYouSure = false
    
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                
                Text("Dot product and cross product Calculator")
                    .font(.custom("Georgia", size: 40, relativeTo: .headline))
                    .multilineTextAlignment(.center)
                
                Image("Vector")
                    .resizable()
                    .scaledToFit()
                    //.aspectRatio(2,contentMode: .fit)
                
                Text("Enter two vectors in <x,y,z> format")
                    .font(.custom("Georgia", size: 20, relativeTo: .headline))
                    .multilineTextAlignment(.center)
                
                HStack {
                    Text("Vector 1: ")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                    
                    TextField("x value", text: $x1)
                        .padding()
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .multilineTextAlignment(.center)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                        )
                        .keyboardType(.numberPad)
                        .onChange(of: x1) { oldValue, newValue in
                            canNavigate = false
                        }
                    TextField("y value", text: $y1)
                        .padding()
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .multilineTextAlignment(.center)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                        )
                        .keyboardType(.numberPad)
                        .onChange(of: y1) { oldValue, newValue in
                            canNavigate = false
                        }
                    TextField("z value", text: $z1)
                        .padding()
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .multilineTextAlignment(.center)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                        )
                        .keyboardType(.numberPad)
                        .onChange(of: z1) { oldValue, newValue in
                            canNavigate = false
                        }
                    
                }
                HStack {
                    Text("Vector 2: ")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                    
                    TextField("x value", text: $x2)
                        .padding()
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .multilineTextAlignment(.center)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                        )
                        .keyboardType(.numberPad)
                        .onChange(of: x2) { oldValue, newValue in
                            canNavigate = false
                        }
                    
                    TextField("y value", text: $y2)
                        .padding()
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .multilineTextAlignment(.center)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                        )
                        .keyboardType(.numberPad)
                        .onChange(of: y2) { oldValue, newValue in
                            canNavigate = false
                        }
                    TextField("z value", text: $z2)
                        .padding()
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .multilineTextAlignment(.center)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                        )
                        .keyboardType(.numberPad)
                        .onChange(of: z2) { oldValue, newValue in
                            canNavigate = false
                        }
                }
                                
                Spacer()
                
                Button("Calculate"){
                    answerDot = (dotProduct(x1: x1, y1: y1, z1: z1, x2: x2, y2: y2, z2: z2))
                    answerCross = crossProduct(x1: x1, y1: y1, z1: z1, x2: x2, y2: y2, z2: z2)
                }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                HStack(){
                    Spacer()
                    NavigationLink("show Answers") {
                        AnswerScreen(dotProduct: answerDot, crossProduct: answerCross,vectors:convertToInt(x1: x1, y1: y1, z1: z1, x2: x2, y2: y2, z2: z2))
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.black)
                    .disabled(!canNavigate)
                    
                    Spacer()
                    
                    Button("clear all"){
                        areYouSure.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.black)
                    Spacer()
                }
            }
        }
        .padding()
        .alert("enter numbers pls", isPresented: $showAlert) {
            
        }
        .alert("Are you sure?", isPresented: $areYouSure) {
            Button("yes"){
                x1 = "0"
                y1 = "0"
                z1 = "0"
                x2 = "0"
                y2 = "0"
                z2 = "0"
            }
            Button("no"){
                
            }
        }
    }
    
    func dotProduct(x1: String, y1: String, z1: String, x2: String, y2: String, z2: String)->Double{
        
        if let intX1 = Double(x1), let intY1 = Double(y1), let intZ1 = Double(z1), let intX2 = Double(x2), let intY2 = Double(y2), let intZ2 = Double(z2){
            canNavigate = true
            return (intX1 * intX2) + (intY1 * intY2) + (intZ1 * intZ2)
            
        } else {
            
            showAlert.toggle()
            return 0
            
        }
    }
    
    func crossProduct(x1: String, y1: String, z1: String, x2: String, y2: String, z2: String)->[Double]{
        
        if let intX1 = Double(x1), let intY1 = Double(y1), let intZ1 = Double(z1), let intX2 = Double(x2), let intY2 = Double(y2), let intZ2 = Double(z2) {
            
            let i = (intY1 * intZ2) - (intY2 * intZ1)
            
            var j = (intX1 * intZ2) - (intX2 * intZ1)
            
            let k = (intX1 * intY2) - (intX2 * intY1)
            
            //the thing shows the j component as negative 0 sometimes
            //why does this work what why how
            if j == -0.0{
                j = -0.0
            }
            
            return [i, (-1) * (j), k]
            
        } else {
            
            return [0,0,0]
            
        }
    }
    
    func convertToInt(x1: String, y1: String, z1: String, x2: String, y2: String, z2: String)->[Double]{
        if let intX1 = Double(x1), let intY1 = Double(y1), let intZ1 = Double(z1), let intX2 = Double(x2), let intY2 = Double(y2), let intZ2 = Double(z2) {
            return [intX1, intY1, intZ1, intX2, intY2, intZ2]
        } else {
            return [0,0,0,0,0,0]
        }
    }
}
#Preview {
    ContentView()
}

