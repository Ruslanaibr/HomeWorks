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
    
    //Smeshariki button pressed
    
    @objc private func button1Pressed () {
        let destinationVC = PlayerViewController()
        destinationVC.songName = "Smeshariki - Ot Vinta!.mp3"
        destinationVC.songUrl = song1.url
        destinationVC.songImgName = "smeshariki"
        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    @objc private func button2Pressed () {
        let destinationVC = PlayerViewController()
        destinationVC.songName = "Mo Rodgers - Black Coffee.mp3"
        destinationVC.songUrl = song2.url
        destinationVC.songImgName = "blackCoffee"
        navigationController?.pushViewController(destinationVC, animated: true)
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
    
    //View
    private func configureView () {
        view.backgroundColor                                     = .white
        
        navigationController?.navigationBar.prefersLargeTitles   = true
        title = "PlayList"
        
        let appearance                                           = UINavigationBarAppearance()
        appearance.backgroundColor                               = Const.Color.dark
        appearance.titleTextAttributes                           = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes                      = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.tintColor            = .white
        navigationController?.navigationBar.standardAppearance   = appearance
        navigationController?.navigationBar.compactAppearance    = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    
    //Main Stack
    private func configureMainStack () {
        view.addSubview(mainStack)
        
        mainStack.axis = .vertical
        mainStack.spacing = 10
        mainStack.distribution = .fillEqually
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStack.heightAnchor.constraint(equalToConstant: view.frame.height/4),
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        mainStack.addArrangedSubview(cellStack1)
        mainStack.addArrangedSubview(cellStack2)
        configureCellStack1()
        configureCellStack2()
    }
    
    //Cell Stack1
    private func configureCellStack1 () {
        cellStack1.axis = .horizontal
        cellStack1.spacing = 20
        cellStack1.distribution = .fillProportionally

        
        cellStack1.addArrangedSubview(songImage1)
        cellStack1.addArrangedSubview(songButton1)
        cellStack1.addArrangedSubview(durLabel1)
        
        let min = Int(song1.duration/60)
        let sec = Int(song1.duration.truncatingRemainder(dividingBy: 60))
        durLabel1.text = "\(min)m \(sec)s"

        songButton1.setTitle("Smeshariki - Ot Vinta!.mp3", for: .normal)
        songButton1.setTitleColor(.black, for: .normal)
        songButton1.titleLabel?.numberOfLines = 0
        songButton1.addTarget(self, action: #selector(button1Pressed), for: .touchUpInside)
        
        //image1
        songImage1.image = UIImage(named: "smeshariki")
        songImage1.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            songImage1.widthAnchor.constraint(equalToConstant: view.bounds.size.width/5)
        ])
    }
    //Cell Stack2
    private func configureCellStack2 () {
        cellStack2.axis = .horizontal
        cellStack2.spacing = 20
        cellStack2.distribution = .fillProportionally
        
        cellStack2.addArrangedSubview(songImage2)
        cellStack2.addArrangedSubview(songButton2)
        cellStack2.addArrangedSubview(durLabel2)
        
        let min = Int(song2.duration/60)
        let sec = Int(song2.duration.truncatingRemainder(dividingBy: 60))
        durLabel2.text = "\(min)m \(sec)s"
        songButton2.setTitle("Mo Rodgers - Black Coffee.mp3", for: .normal)
        songButton2.setTitleColor(.black, for: .normal)
        songButton2.titleLabel?.numberOfLines = 0
        songButton2.addTarget(self, action: #selector(button2Pressed), for: .touchUpInside)
        
        //image2
        songImage2.image = UIImage(named: "blackCoffee")
        songImage2.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            songImage2.widthAnchor.constraint(equalToConstant: view.bounds.size.width/5)
        ])
    }
    
    
}

