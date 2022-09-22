//
//  ContentView.swift
//  cw7(2)
//
//  Created by Ali AlShammari on 21/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State var tapped = false
    @State var minus = "minus.circle"
    @State var plus = "plus.circle"
    @State var blanck = ""
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Image(systemName: tapped ? minus : plus)
                    .padding()
                    .foregroundColor(tapped ? .red : .green)
                Text("اختر تخصصك")
                    .foregroundColor(.blue)
                    .frame(width: 200, height: 30)
            }
            Spacer()
            if tapped {
                Text("هندسة كمبيوتر")
                    .frame(width: 230, height: 50)
                    .foregroundColor(.black)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
                    .onTapGesture {
                        blanck = "هندسة كمبيوتر"
                    }
                Text("هندسة كهربائية")
                    .frame(width: 230, height: 50)
                    .foregroundColor(.black)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
                    .onTapGesture {
                        blanck = "هندسة كهربائية"
                    }
                Text("تخصص آخر")
                    .frame(width: 230, height: 50)
                    .foregroundColor(.black)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
                    .onTapGesture {
                        blanck = "تخصص آخر"
                        
                    }
            }
            Spacer()
            HStack{
            Text(blanck)
            Text("التخصص:")
            }
        }
        .font(.largeTitle)
        .padding()
        .foregroundColor(.black)
        .onTapGesture {
            withAnimation(.easeIn(duration: 0.5)) {
            tapped.toggle()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
