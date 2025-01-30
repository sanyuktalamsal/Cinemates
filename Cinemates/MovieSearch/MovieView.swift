//
//  MovieView.swift
//  Cinemates
//
//  Created by Sanyukta Lamsal on 11/27/23.
//

import SwiftUI

struct MovieView: View {
    @StateObject private var vm = MovieServiceViewModel()
    @State private var selectedMovie: Movie?

    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        HStack {
                            TextField("Search for a movie", text: $vm.title)
                                .font(.system(size: 18))
                            Button {
                                Task {
                                    await vm.searchMovies(title: vm.title)
                                }
                            } label: {
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 18))
                                    .font(.headline)
                                    .foregroundColor(.blue)
                            }
                        }
                    }

                    Section {
                        switch vm.state {
                        case .success(let movies):
                            moviesList(movies)
                        case .idle:
                            idleView
                        case .loading:
                            loadingView
                        case .error(let error):
                            errorView(error)
                        }
                    }
                }
                .navigationTitle("Search Cinemates")
            }
            .sheet(item: $selectedMovie) { movie in
                MovieDetailView(movie: movie)
            }
        }
    }

    @ViewBuilder
    private var idleView: some View {
        EmptyView()
    }

    @ViewBuilder
    private var loadingView: some View {
        Text("Loading...")
    }

    @ViewBuilder
    private func moviesList(_ results: [Movie]) -> some View {
        ForEach(results) { movie in
            NavigationLink(destination: MovieDetailView(movie: movie)) {
                HStack {
                    if let posterURL = movie.posterURL {
                        AsyncImage(url: posterURL) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 90)
                                    .cornerRadius(8)
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 90)
                                    .cornerRadius(8)
                            @unknown default:
                                Text("Unexpected state")
                            }
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("\(movie.title ?? "")")
                            .lineLimit(1)
                        Text("\(movie.overview ?? "")")
                            .font(.system(size: 12))
                            .foregroundColor(.secondary)
                    }.frame(height: 90)
                }
            }
        }
    }


    @ViewBuilder
    private func errorView(_ error: Error) -> some View {
        Text(error.localizedDescription)
    }
}

struct MovieDetailView: View {
    @State private var userReview: String = ""
    let movie: Movie

    var body: some View {
        VStack {
            if let backdropURL = movie.backdropURL {
                AsyncImage(url: backdropURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(8)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(8)
                    @unknown default:
                        Text("Unexpected state")
                    }
                }
            }

            Text(movie.overview ?? "")
                .foregroundColor(.secondary)
                .padding()
            Spacer()
            TextField("Write a review", text: $userReview, axis: .vertical)
                .padding()
                .textFieldStyle(.roundedBorder)
                .foregroundColor(.gray)

            Button("Done") {
                userReview = ""
                        }
                        .padding(.horizontal, 8)
                        .frame(height: 20)
                        .foregroundColor(.white)
                        .background(Color.indigo)
                        .cornerRadius(8)
                    }
                    .padding()
                    .navigationTitle(movie.title ?? "")
                }
}


struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
