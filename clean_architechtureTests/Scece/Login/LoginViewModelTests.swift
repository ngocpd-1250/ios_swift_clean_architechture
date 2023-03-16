//
//  LoginViewModelTests.swift
//  clean_architechtureTests
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

@testable import clean_architechture
import XCTest
import RxSwift
import RxCocoa
import RxTest

final class LoginViewModelTests: XCTestCase {
    private var viewModel: LoginViewModel!
    private var navigator: LoginNavigatorMock!
    private var loginUseCase: LoginUseCaseMock!
    private var input: LoginViewModel.Input!
    private var output: LoginViewModel.Output!
    private var disposeBag: DisposeBag!
    private var scheduler: TestScheduler!

    private let email = PublishSubject<String>()
    private let password = PublishSubject<String>()
    private let login = PublishSubject<Void>()

    private var errorOutput: TestableObserver<Error>!
    private var isEnableOutput: TestableObserver<Bool>!
    private var emailValidateMessageOuput: TestableObserver<String>!
    private var passwordValidateMessageOuput: TestableObserver<String>!

    override func setUp() {
        super.setUp()
        navigator = LoginNavigatorMock()
        loginUseCase = LoginUseCaseMock()
        viewModel = LoginViewModel(navigator: navigator,
                                   loginUseCase: loginUseCase)

        input = LoginViewModel.Input(email: email.asDriverOnErrorJustComplete(),
                                     password: password.asDriverOnErrorJustComplete(),
                                     login: login.asDriverOnErrorJustComplete())
        disposeBag = DisposeBag()
        scheduler = TestScheduler(initialClock: 0)

        errorOutput = scheduler.createObserver(Error.self)
        isEnableOutput = scheduler.createObserver(Bool.self)
        emailValidateMessageOuput = scheduler.createObserver(String.self)
        passwordValidateMessageOuput = scheduler.createObserver(String.self)

        output = viewModel.transform(input, disposeBag: disposeBag)

        let subscriptions = [
            output.$error.unwrap()
                .subscribe(errorOutput),
            output.$isEnabled
                .subscribe(isEnableOutput),
            output.$passwordValidationMessage
                .subscribe(passwordValidateMessageOuput),
            output.$emailValidationMessage
                .subscribe(emailValidateMessageOuput)
        ]

        subscriptions.disposed(by: disposeBag)
    }

    func test_emailInvalid_disableButton() {
        // arrange
        scheduler.createColdObservable([.next(0, "abc@.com")])
            .bind(to: email)
            .disposed(by: disposeBag)

        scheduler.createColdObservable([.next(0, "Aa@123456")])
            .bind(to: password)
            .disposed(by: disposeBag)

        scheduler.createColdObservable([.next(0, ())])
            .bind(to: login)
            .disposed(by: disposeBag)

        // act
        scheduler.start()

        // assert
        XCTAssertEqual(isEnableOutput.lastEventElement, false)
    }

    func test_passwordInvalid_disableButton() {
        // arrange
        scheduler.createColdObservable([.next(0, "abc@gmail.com")])
            .bind(to: email)
            .disposed(by: disposeBag)

        scheduler.createColdObservable([.next(0, "Aa123456")])
            .bind(to: password)
            .disposed(by: disposeBag)

        scheduler.createColdObservable([.next(0, ())])
            .bind(to: login)
            .disposed(by: disposeBag)

        // act
        scheduler.start()

        // assert
        XCTAssertEqual(isEnableOutput.lastEventElement, false)
    }

    func test_emailValid_passwordValid_enableButton_callLogin_toHome() {
        // arrange
        scheduler.createColdObservable([.next(0, "abc@gmail.com")])
            .bind(to: email)
            .disposed(by: disposeBag)

        scheduler.createColdObservable([.next(0, "Aa@123456")])
            .bind(to: password)
            .disposed(by: disposeBag)

        scheduler.createColdObservable([.next(0, ())])
            .bind(to: login)
            .disposed(by: disposeBag)

        // act
        scheduler.start()

        // assert
        XCTAssertEqual(isEnableOutput.lastEventElement, true)
        XCTAssertEqual(loginUseCase.login_Called, true)
        XCTAssertEqual(navigator.toHome_Called, true)
    }

    func test_emailValid_passwordValid_enableButton_callLogin_error() {
        // arrange
        loginUseCase.login_ReturnValue = Observable.error(TestError())

        scheduler.createColdObservable([.next(0, "abc@gmail.com")])
            .bind(to: email)
            .disposed(by: disposeBag)

        scheduler.createColdObservable([.next(0, "Aa@123456")])
            .bind(to: password)
            .disposed(by: disposeBag)

        scheduler.createColdObservable([.next(0, ())])
            .bind(to: login)
            .disposed(by: disposeBag)

        // act
        scheduler.start()

        // assert
        XCTAssertEqual(isEnableOutput.lastEventElement, true)
        XCTAssertEqual(loginUseCase.login_Called, true)
        XCTAssertTrue(errorOutput.lastEventElement is TestError)
        XCTAssertEqual(navigator.toHome_Called, false)
    }
}
