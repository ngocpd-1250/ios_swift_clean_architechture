//
//  LoginViewModel.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/08.
//

import RxSwift
import RxCocoa

struct LoginViewModel {
    let navigator: LoginNavigatorType
    var loginUseCase: LoginUseCaseType = Resolver.resolve()
    var validateEmailUseCase: ValidateEmailUseCaseType = Resolver.resolve()
    var validatePasswordUseCase: ValidatePasswordUseCaseType = Resolver.resolve()
}

// MARK: - ViewModel
extension LoginViewModel: ViewModel {
    struct Input {
        let email: Driver<String>
        let password: Driver<String>
        let login: Driver<Void>
    }
    
    struct Output {
        @Property var emailValidationMessage = ""
        @Property var passwordValidationMessage = ""
        @Property var isLoading = false
        @Property var error: Error?
        @Property var isEnabled = false
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        let errorTracker = ErrorTracker()
        let activityIndicator = ActivityIndicator()
        
        let loginInfo = Driver.combineLatest(input.email, input.password)
        
        let emailValidation = Driver.combineLatest(input.email, input.login)
            .map { $0.0 }
            .map(validateEmailUseCase.validateEmail(email:))
        
        let passwordValidation = Driver.combineLatest(input.password, input.login)
            .map { $0.0 }
            .map(validatePasswordUseCase.validatePassword(password:))
        
        let isValidInput = Driver.combineLatest(emailValidation, passwordValidation)
            .map { $0.0.isValid && $0.1.isValid }
        
        emailValidation
            .map { $0.firstMessage }
            .drive(output.$emailValidationMessage)
            .disposed(by: disposeBag)
        
        passwordValidation
            .map { $0.firstMessage }
            .drive(output.$passwordValidationMessage)
            .disposed(by: disposeBag)
        
        isValidInput
            .drive(output.$isEnabled)
            .disposed(by: disposeBag)
        
        input.login
            .withLatestFrom(isValidInput)
            .filter { $0 == true }
            .withLatestFrom(loginInfo)
            .flatMapLatest { (email, password) in
                self.loginUseCase.login(email: email, password: password)
                    .trackActivity(activityIndicator)
                    .trackError(errorTracker)
                    .asDriverOnErrorJustComplete()
            }
            .drive(onNext: navigator.toMovieList)
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
