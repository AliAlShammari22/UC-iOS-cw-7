//
//  ContentView.swift
//  cw7
//
//  Created by Ali AlShammari on 21/09/2022.
//

import SwiftUI

struct Castmembers: Identifiable {
    let id = UUID()
    let image : String
    let name: String
}

struct MoviesInfo: Identifiable {
    let id = UUID()
    
    var tital: String
    var image: String
    var cast : [Castmembers]
}

struct ContentView: View {
    let Movies = [
        MoviesInfo(tital: "Deadpool", image: "Deadpool", cast: [
        
            Castmembers(image: "Ryan Reynolds", name: "Ryan Reynolds"),
            Castmembers(image: "Morena Baccarin", name: "Morena Baccarin"),
            Castmembers(image: "Gina Carano", name: "Gina Carano"),
            Castmembers(image: "Ed Skrein", name: "Ed Skrein"),
            Castmembers(image: "T.J. Miller", name: "T.J. Miller")
        
        ]),
        MoviesInfo(tital: "Top Gun: Mavrick", image: "Top Gun: Mavrick", cast: [
                    
                    Castmembers(image: "Tom Cruise", name: "Tom Cruise"),
                    Castmembers(image: "Miles Teller", name: "Miles Teller"),
                    Castmembers(image: "Glen Powell", name: "Glen Powell"),
                    Castmembers(image: "Monica Barbaro", name: "Monica Barbaro"),
                    Castmembers(image: "Val Kilmer", name: "Val Kilmer")
                
        ]),
        
        
        MoviesInfo(tital: "Interstellar", image: "Interstellar", cast: [
                    
                    Castmembers(image: "Matthew", name: "Matthew"),
                    Castmembers(image: "Jessica Chastain", name: "Jessica Chastain"),
                    Castmembers(image: "Anne Hathaway", name: "Anne Hathaway"),
                    Castmembers(image: "Mackenzie Foy", name: "Mackenzie Foy"),
                    Castmembers(image: "Timothée Chalamet", name: "Timothée Chalamet")
                
        ])
        
        
        
    ]
    var body: some View {
        NavigationView{
            List{
                ForEach(Movies) { movie in
                    NavigationLink(destination: Moviecast(Movies: movie)) {
                        MovieView(Movies: movie)
                    }
                }
            }
            .navigationTitle("Movies List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MovieView: View {
    let Movies: MoviesInfo
    var body: some View {
        HStack{
            Image(Movies.image)
                .resizable()
                .clipShape(Circle())
                .frame(width: 100, height: 100)
            Text(Movies.tital)
                .font(.title)
        }
    }
}

struct Moviecast: View {
    let Movies: MoviesInfo
    var body: some View {
        ZStack{
            Image(Movies.image)
                .resizable()
                .scaledToFill()
                .blur(radius: 10)
                .ignoresSafeArea()
            VStack{
                Image(Movies.image)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 200, height: 200)
                Text(Movies.tital)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .padding()
                ScrollView (.horizontal) {
                    HStack{
                        ForEach(Movies.cast) {
                            castmember in
                            VStack{
                                Text(castmember.name)
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding()
                                Image(castmember.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 130, height: 155)
                            }
                        }
                    }
                }
                
            }
        }
    }
}

