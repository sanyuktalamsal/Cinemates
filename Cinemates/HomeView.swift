//
//  HomeView.swift
//  Cinemates
//
//  Created by Sanyukta Lamsal on 12/3/23.
//

import SwiftUI

struct HomeView: View {
    let posts: [Post] = [
        Post(username: "chloelin", caption: "loved this movie!", imageName: "Ballad"),
        Post(username: "nathank", caption: "i cried...", imageName: "lala"),
        Post(username: "samchowdhury", caption: "CRAZYYY!", imageName: "Saltburn"),
        // Add more posts as needed
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(posts) { post in
                    PostView(post: post)
                        .padding(.bottom, 16)
                }
            }
            .navigationBarTitle("Cinemates")
        }
    }
}


struct Post: Identifiable {
    var id = UUID()
    let username: String
    let caption: String
    let imageName: String
}

struct PostView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(post.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .scaledToFit()
                .frame(width: 240, height: 360)
                .clipped()
            HStack {
                Text("\(post.username):")
                    .font(.headline)
                Text(post.caption)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
        }
        .padding(8)
    }
}

struct PostDetail: View {
    let post: Post
    
    var body: some View {
        VStack {
            Image(post.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Text(post.caption)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .navigationBarTitle(post.username, displayMode: .inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

