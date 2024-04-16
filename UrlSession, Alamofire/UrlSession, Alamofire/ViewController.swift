//
//  ViewController.swift
//  UrlSession, Alamofire
//
//  Created by Демьян on 16.04.2024.
//

import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {
    
    let service = Service()
    let alamofire = Alamofire()
    
    private let serchTextField: UITextField = {
       let field = UITextField()
        field.placeholder = "Введите запрос"
        field.borderStyle = .roundedRect
        return field
    }()
    
    private let urlSessionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("URLSession", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }()
    
    @objc private func buttonTap() {
        service.getRequest(keyWord: serchTextField.text) { result in
            switch result {
            case .success(let data):
                do {
                    if let jsonString = String(data: data, encoding: .utf8) {
                        self.textView.text = jsonString
                    }
                }
            case .failure(let error):
                self.textView.text = "\(error)"
            }
        }
    }
    
    private let alamofireButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Alamofire", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(alamofireTap), for: .touchUpInside)
        return button
    }()
    
    @objc private func alamofireTap() {
        alamofire.getRequest(keyWord: serchTextField.text) { data in
            let dataa = data
                if let jsonString = String(data: dataa, encoding: .utf8) {
                    self.textView.text = jsonString
                }
            }
        }
    
    
    private let textView: UITextView = {
       let view = UITextView()
        view.textColor = .black
        view.layer.cornerRadius = 6
        view.font = UIFont.systemFont(ofSize: 20)
        view.layer.borderWidth = 2
        view.textContainerInset = .zero
        view.isEditable = true
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        view.backgroundColor = .white
    }
    
    private func setViews() {
        view.addSubview(serchTextField)
        view.addSubview(urlSessionButton)
        view.addSubview(alamofireButton)
        view.addSubview(textView)
    }
    
    private func setConstraints() {
        serchTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.left.right.equalToSuperview().inset(30)
        }
        
        urlSessionButton.snp.makeConstraints {
            $0.top.equalTo(serchTextField).offset(75)
            $0.left.equalToSuperview().inset(70)
            $0.width.equalTo(100)
        }
        
        alamofireButton.snp.makeConstraints {
            $0.top.equalTo(serchTextField).offset(75)
            $0.left.equalTo(urlSessionButton).inset(150)
            $0.width.equalTo(100)
        }
        
        textView.snp.makeConstraints {
            $0.top.equalTo(urlSessionButton).inset(50)
            $0.left.right.equalToSuperview().inset(30)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
    }

}

