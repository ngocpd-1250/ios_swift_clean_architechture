//
//  MovieListViewModel.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

import RxSwift
import RxCocoa

struct MovieListViewModel {
    let navigator: MovieListNavigatorType
    let getTopRatedMoviesUseCase: GetTopRatedMoviesUseCaseType = Resolver.resolve()
}

// MARK: - ViewModel
extension MovieListViewModel: ViewModel {
    struct Input {
        let load: Driver<Void>
    }
    
    struct Output {
        @Property var movies: [Movie] = []
        @Property var isLoading = false
        @Property var error: Error?
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        let errorTracker = ErrorTracker()
        let activityIndicator = ActivityIndicator()
        
        input.load
            .flatMapLatest {
                self.getTopRatedMoviesUseCase.getTopRatedMovies()
                    .trackActivity(activityIndicator)
                    .trackError(errorTracker)
                    .asDriverOnErrorJustComplete()
            }
            .drive(output.$movies)
            .disposed(by: disposeBag)
        
        errorTracker
            .drive(output.$error)
            .disposed(by: disposeBag)
        
        let isLoading = activityIndicator.asDriver()
        
        isLoading
            .drive(output.$isLoading)
            .disposed(by: disposeBag)
        
        return output
    }
}
