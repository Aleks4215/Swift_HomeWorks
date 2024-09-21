//
//  ViewController.swift
//  hw21
//
//  Created by Алексей on 7.09.24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var changeStyleActions: [UIAction] = [
        UIAction(title: "Bold", handler: { [weak self] _ in
        self?.changeStyle(style: .traitBold)
    }),
        UIAction(title: "Italic", handler: { [weak self] _ in
            self?.changeStyle(style: .traitItalic)
        }),
        UIAction(title: "Medium", handler: {[weak self] _ in
            self?.changeStyle(style: .traitBold)
        })
    ]
    
    lazy var changeFontsizeActions: [UIAction] = [
        UIAction(title: "3", handler: { [weak self] _ in
            self?.changeFontSize(to: 3)
        }),
        UIAction(title: "15", handler: {[weak self] _ in
            self?.changeFontSize(to: 15)
        }),
        UIAction(title: "35", handler: {[weak self] _ in
            self?.changeFontSize(to: 35)
        })
    ]
    
    lazy var changeTextColorActions: [UIAction] = [
        UIAction(title: "Красный", handler: { [weak self] _ in
            self?.changeTextColor(to: .red)
        }),
        UIAction(title: "Зеленый", handler: { [weak self] _ in
            self?.changeTextColor(to: .green)
        }),
        UIAction(title: "Синий", handler: { [weak self] _ in
            self?.changeTextColor(to: .blue)
        })
    ]
    
    lazy var wrapper: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.text = "42354234534533545656436546453456645645"
        textView.font = .systemFont(ofSize: 9)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var vStack: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var clearAtributedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Отменить изменения", for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(removeAllAttributes), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    func makeSegmentControlWithTitle(title: String, actions: [UIAction]) -> UIView {
        let label = UILabel()
        label.text = title
        
        let stackView = UIStackView(arrangedSubviews: [label, UISegmentedControl(frame: .zero, actions: actions)])
        stackView.setCustomSpacing(5, after: label)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
    
    func setupWrapper() {
        view.addSubview(wrapper)
        NSLayoutConstraint.activate([
            wrapper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            wrapper.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            wrapper.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            wrapper.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupTextView() {
        wrapper.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.topAnchor, constant: 25),
            textView.leadingAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            textView.trailingAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            textView.heightAnchor.constraint(equalTo: wrapper.heightAnchor, multiplier: 0.2)
        ])
        textView.backgroundColor = .systemFill
    }
    
    func setupVStackView() {
        let changeStyleSegment = makeSegmentControlWithTitle(title: "Смена стиля", actions: changeStyleActions)
        wrapper.addSubview(changeStyleSegment)
        
        let changeSizeSegment = makeSegmentControlWithTitle(title: "Изменить размер", actions: changeFontsizeActions)
        wrapper.addSubview(changeSizeSegment)
        
        let changeColorSegment = makeSegmentControlWithTitle(title: "Изменить цвет", actions: changeTextColorActions)
        wrapper.addSubview(changeColorSegment)
        
        NSLayoutConstraint.activate([
            changeStyleSegment.topAnchor.constraint(equalTo: textView.safeAreaLayoutGuide.bottomAnchor, constant: 15),
            changeStyleSegment.leadingAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            changeSizeSegment.trailingAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            changeSizeSegment.topAnchor.constraint(equalTo: changeStyleSegment.safeAreaLayoutGuide.bottomAnchor, constant: 15),
            changeSizeSegment.leadingAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            changeSizeSegment.trailingAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            changeColorSegment.topAnchor.constraint(equalTo: changeSizeSegment.safeAreaLayoutGuide.bottomAnchor, constant: 15),
            changeColorSegment.leadingAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            changeColorSegment.trailingAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.trailingAnchor, constant: -15),
        ])
    }
    
    func changeStyle(style: UIFontDescriptor.SymbolicTraits) {
        let range = textView.selectedRange
        guard range.length > 0 else { return }
        
        let currentAttributes = textView.attributedText.attributes(at: range.location, effectiveRange: nil)
        let currentFont = currentAttributes[.font] as? UIFont ?? UIFont.systemFont(ofSize: 18)
        var fontDescriptor = currentFont.fontDescriptor
        
        switch style {
        case .traitBold:
            fontDescriptor = fontDescriptor.withSymbolicTraits(fontDescriptor.symbolicTraits.union(.traitBold)) 
                ?? fontDescriptor

        case .traitItalic:
            fontDescriptor = fontDescriptor.withSymbolicTraits(fontDescriptor.symbolicTraits.union(.traitItalic)) 
                ?? fontDescriptor

        case [.traitBold, .traitItalic]:
            fontDescriptor = fontDescriptor.withSymbolicTraits([.traitBold, .traitItalic]) 
                ?? fontDescriptor

        default:
            break
        }
        
        let newFont = UIFont(descriptor: fontDescriptor, size: currentFont.pointSize)

        let attributedString = NSMutableAttributedString(attributedString: textView.attributedText)
        attributedString.addAttribute(.font, value: newFont, range: range)
        
        textView.attributedText = attributedString
        textView.selectedRange = range
        clearAtributedButton.isEnabled = true
    }



    
    func changeFontSize(to newSize: CGFloat) {
        let range = textView.selectedRange
        
        guard range.length > 0 else { return }

        let attributedString = NSMutableAttributedString(attributedString: textView.attributedText)
        
        attributedString.enumerateAttribute(.font, in: range, options: []) { (value, range, _) in
            if let currentFont = value as? UIFont {
                let fontDescriptor = currentFont.fontDescriptor
                let newFont = UIFont(descriptor: fontDescriptor, size: newSize)
                attributedString.addAttribute(.font, value: newFont, range: range)
            }
        }
        
        textView.attributedText = attributedString
        textView.selectedRange = range
        clearAtributedButton.isEnabled = true
    }
    
    func changeTextColor(to color: UIColor) {
        let range = textView.selectedRange
        guard range.length > 0 else { return }
        
        let attributedString = NSMutableAttributedString(attributedString: textView.attributedText)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        
        textView.attributedText = attributedString
        textView.selectedRange = range
        clearAtributedButton.isEnabled = true
    }


    @objc func removeAllAttributes() {
        let selectedRange = textView.selectedRange
        let plainText = textView.text(in: textView.selectedTextRange!)
        let newAttributedText = NSAttributedString(string: plainText ?? "")
        let mutableAttributedText = NSMutableAttributedString(attributedString: textView.attributedText)
        mutableAttributedText.replaceCharacters(in: 
                                                    NSRange(location: selectedRange.location,
                                                            length: selectedRange.length),
                                                with: newAttributedText)
        
        textView.attributedText = mutableAttributedText
        textView.selectedRange = selectedRange
        clearAtributedButton.isEnabled = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWrapper()
        setupTextView()
        setupVStackView()
    }
}

