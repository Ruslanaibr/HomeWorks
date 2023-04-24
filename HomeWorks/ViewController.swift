//
//  ViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 20.04.2023.
//

import UIKit
import AVFoundation

final class ViewController: UIViewController {
    
    private let mainStack   = UIStackView()
    private let cellStack1  = UIStackView()
    private let cellStack2  = UIStackView()
    private let songImage1  = UIImageView()
    private let songImage2  = UIImageView()
    private let songButton1 = UIButton()
    private let songButton2 = UIButton()
    private let durLabel1   = UILabel()
    private let durLabel2   = UILabel()
    private var song1       = AVAudioPlayer()
    private var songName1   = String()
    private var song2       = AVAudioPlayer()
    private var songname2   = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    private func setupLayouts () {
        configureView()
        configureSong1()
        configureSong2()
        configureMainStack()
        configureCellStack1()
        configureCellStack2()
    }
    
    
    //View
    private func configureView () {
        view.backgroundColor                                     = .white
        
        navigationController?.navigationBar.prefersLargeTitles   = true
        
        let appearance                                           = UINavigationBarAppearance()
        appearance.backgroundColor                               = Const.Color.green
        appearance.titleTextAttributes                           = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes                      = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.tintColor            = .white
        navigationController?.navigationBar.standardAppearance   = appearance
        navigationController?.navigationBar.compactAppearance    = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    // 1 Song
    private func configureSong1 () {
        do {
            if let audioPath = Bundle.main.path(forResource: "OtVinta", ofType: "mp3") {
                try song1 = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
        } catch {
            print("Song1 upload Error")
        }
    }
    
    // 2 Song
    private func configureSong2 () {
        do {
            if let audioPath = Bundle.main.path(forResource: "BlackCoffee", ofType: "mp3") {
                try song2 = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                
            }
        } catch {
            print("Song2 upload Error")
        }
    }
    
    
    //Main Stack
    private func configureMainStack () {
        view.addSubview(mainStack)
        
        mainStack.frame = view.bounds
        mainStack.heightAnchor.constraint(equalToConstant: view.frame.height/2).isActive = true
        mainStack.axis = .vertical
        mainStack.spacing = 20
        mainStack.distribution = .fillEqually
        
        mainStack.addArrangedSubview(cellStack1)
        mainStack.addArrangedSubview(cellStack2)
        configureCellStack1()
        configureCellStack2()
    }
    
    //Cell Stack1
    private func configureCellStack1 () {
        cellStack1.axis = .horizontal
        cellStack1.spacing = 20
        cellStack1.distribution = .fill
        cellStack1.alignment = .fill
        
        cellStack1.addArrangedSubview(songImage1)
        cellStack1.addArrangedSubview(songButton1)
        cellStack1.addArrangedSubview(durLabel1)
        
        
        durLabel1.text = String(song1.duration)
        songButton1.setTitle("Smeshariki - Ot Vinta!.mp3", for: .normal)
        songButton1.setTitleColor(.black, for: .normal)
        songImage1.image = UIImage(named: "smeshariki")
        songImage1.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            songImage1.widthAnchor.constraint(equalToConstant: 70),
            songImage2.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    //Cell Stack2
    private func configureCellStack2 () {
        cellStack2.axis = .horizontal
        cellStack2.spacing = 20
        cellStack2.distribution = .fill
        cellStack2.alignment = .fill
        
        cellStack2.addArrangedSubview(songImage2)
        cellStack2.addArrangedSubview(songButton2)
        cellStack2.addArrangedSubview(durLabel2)
        
        durLabel2.text = String(song2.duration)
        songButton2.setTitle("Mo Rodgers - Black Coffee.mp3", for: .normal)
        songButton2.setTitleColor(.black, for: .normal)
        songImage2.image = UIImage(named: "blackCoffee")
        songImage2.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            songImage1.widthAnchor.constraint(equalToConstant: 70),
            songImage2.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    
}

