//
//  LoginViewController.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/08.
//

import UIKit
import RxSwift
import Reusable
import SwiftGradients

final class LoginViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Properties
    
    var viewModel: LoginViewModel!
    var disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addGradient(
            colors: [.pink, .lowPink],
            direction: .bottomToTop
        )
    }
    
    deinit {
        logDeinit()
    }
    
    // MARK: - Methods
    
    private func configView() {
        loginButton.setTitle(R.string.localizable.loginButton(), for: .normal)
    }
    
    func bindViewModel() {
        
        let input = LoginViewModel.Input(email: emailTextField.rx.text.orEmpty.asDriver(),
                                         password: passwordTextField.rx.text.orEmpty.asDriver(),
                                         login: loginButton.rx.tap.asDriver())
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        let subscriptions = [
            output.$emailValidationMessage
                .asDriver()
                .drive(emailErrorLabel.rx.text),
            output.$passwordValidationMessage
                .asDriver()
                .drive(passwordErrorLabel.rx.text),
            output.$isLoading
                .asDriver()
                .drive(rx.isLoading),
            output.$error
                .unwrap()
                .asDriverOnErrorJustComplete()
                .drive(rx.error),
            output.$isEnabled
                .asDriver()
                .skip(1)
                .drive(loginButton.rx.isEnabled)
        ]
        
        subscriptions.disposed(by: disposeBag)
        
    }
}

// MARK: - Binders
extension LoginViewController {
    
}

// MARK: - StoryboardSceneBased
extension LoginViewController: StoryboardSceneBased {
    static var sceneStoryboard: UIStoryboard {
        return UIStoryboard(resource: R.storyboard.login)
    }
}
