//
//  ContentView.swift
//  Cinemates
//
//  Created by Sanyukta Lamsal on 12/3/23.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem() {
                    Image(systemName: "house")
            }
            MovieView()
                .tabItem() {
                    Image(systemName: "magnifyingglass")
            }
            ProfileView()
                .tabItem() {
                    Image(systemName: "person.crop.circle")
            }
        }
    }
}

struct ContentViewPreview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

