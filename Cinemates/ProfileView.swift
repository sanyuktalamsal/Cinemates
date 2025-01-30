//
//  ProfileView.swift
//  Cinemates
//
//  Created by Sanyukta Lamsal on 12/3/23.
//


import SwiftUI

struct ProfileView: View {
    @State private var exportPressed = false
    @State private var settingPressed = false
    @StateObject private var vm = MovieServiceViewModel()


    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            exportPressed = true
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(.primary)
                        }
                        Button {
                            settingPressed = true
                        } label: {
                            Image(systemName: "gear")
                                .foregroundColor(.primary)
                        }
                        .padding(.trailing)
                    }
                    Spacer()
                    
                    Image("ProfilePicture")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaledToFit()
                        .clipShape(Circle())
                    
                    Text("Jake and Sanyu")
                        .font(.title)
                    
                    HStack {
                        Text("50 followers")
                            .font(.headline)
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 5, height: 5)
                        Text("10 following")
                            .font(.headline)
                    }.padding(.bottom, 10)
                    Spacer()
                    Text("Jake and Sanyu's Top Picks")
                    ScrollView(.horizontal) {
                        HStack {
                            VStack {
                                Image("mamma")
                                Text("Mamma Mia")
                                    .font(.subheadline)
                            }
                            VStack {
                                Image("lala")
                                Text("La La Land")
                                    .font(.subheadline)
                            }
                            VStack {
                                Image("spiderverse")
                                Text("Spider Man: Into the Spider-Verse")
                                    .font(.subheadline)
                            }
                            VStack {
                                Image("Totoro")
                                Text("My Neighbor Totoro")
                                    .font(.subheadline)
                            }
                            VStack {
                                Image("Midsommar")
                                Text("Midsommar")
                                    .font(.subheadline)
                            }
                            VStack {
                                Image("Notebook")
                                Text("The Notebook")
                                    .font(.subheadline)
                            }
                        }
                    }
                    Text("Recently Watched")
                    ScrollView(.horizontal) {
                        HStack {
                            VStack {
                                Image("Saltburn")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 120, height: 180)
                                 
                                Text("Saltburn")
                                    .font(.subheadline)
                            }
                            VStack {
                                Image("Ballad")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 120, height: 180)
                                Text("The Hunger Gam...")
                                    .font(.subheadline)
                            }
                            VStack {
                                Image("Renaissance")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 120, height: 180)
                                Text("Renaissance: A F...")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
