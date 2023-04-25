//
//  PlayerViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 24.04.2023.
//

import UIKit
import AVFoundation

final class PlayerViewController : UIViewController {
    
    
    var songName : String?
    
    var songUrl : URL?
    
    var songImgName : String?
    
    private let image       = UIImageView()
    private let addImg      = UIImageView()
    private let nameLabel   = UILabel()
    private let etcImg      = UIImageView()
    private let mixImg      = UIImageView()
    private let goToStartButton = UIButton()
    private let playButton      = UIButton()
    private let endButton       = UIButton()
    private let randomImg        = UIImageView()
    private var player           = AVAudioPlayer()
    private var isPlaying : Bool = false
    private let slider           = UISlider()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    private func setupLayouts() {
        configureView()
        configurePlayer()
        configureVStack()
        player.play()
    }
    
    //Actions for music buttons
    //Forward
    @objc func forwardPressed() {
        player.currentTime = 0.0
    }
    //Play
    @objc func playPressed() {
        if player.isPlaying {
            player.stop()
            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            player.play()
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    //Backward
    @objc func endPressed () {
        player.currentTime += 15
    }
    
    // Slider
    
    @objc func sliderChanged () {
        player.currentTime = Double(slider.value)
    }
    
    //Cancel
    
    @objc fileprivate func cancelPressed () {
        navigationController?.popViewController(animated: true)
        player.stop()
    }
    
    //Share
    @objc func sharePressed () {
        let shareController = UIActivityViewController(activityItems: [""], applicationActivities: nil)
        present(shareController, animated: true)
    }
    @objc func updateTime () {
        slider.value = Float(player.currentTime)
    }
    
    
    //  Configure
    
    //View
    
    fileprivate func configureView () {
        view.backgroundColor = Const.Color.white
        let leftItem = UIBarButtonItem(image: UIImage(systemName: "chevron.down"), style: .plain, target: self, action: #selector(cancelPressed))
        navigationItem.leftBarButtonItem = leftItem
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(sharePressed))
        navigationItem.rightBarButtonItem = rightItem
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    //Player
    fileprivate func configurePlayer () {
            do {
                if let url = songUrl {
                    try player = AVAudioPlayer(contentsOf: url)
                }
            } catch {
                print("Error in playing")
            }
        isPlaying = true
    }
    
    //Main Vertical Stack
    private func configureVStack () {
        configureImageView()
        configureSlider()
        let hStack1 = configureHStack1()
        let hStack2 = configureHStack2()
        let array = [image, hStack1, slider, hStack2]
        let vStack = UIStackView(arrangedSubviews: array)
        vStack.axis = .vertical
        vStack.spacing = 20
        vStack.distribution = .equalSpacing
        addConstraintsTo(stack: vStack)
    }
    
    //Constraints to Vertical Stack
    private func addConstraintsTo (stack: UIStackView) {
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
    
    //Image of the song
    fileprivate func configureImageView () {
        if let img = songImgName {
            image.image = UIImage(named: img)
        }
        image.layer.borderColor = Const.Color.dark.cgColor
        image.layer.borderWidth = 20
        image.contentMode = .scaleAspectFit
    }
    
    // Add button, name of the song and ellepsis button Stack
    fileprivate func configureHStack1 ()  -> UIStackView {
        addImg.image = UIImage(systemName: "plus")
        nameLabel.text = songName
        nameLabel.numberOfLines = 0
        etcImg.image = UIImage(systemName: "ellipsis")
        let array = [addImg, nameLabel, etcImg]
        let hStack = UIStackView(arrangedSubviews: array)
        hStack.axis = .horizontal
        hStack.spacing = 5
        hStack.distribution = .equalSpacing
        return hStack
    }
    
    // Slider
    fileprivate func configureSlider () {
        slider.minimumValue = 0.0
        slider.maximumValue = Float(player.duration)
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        slider.minimumTrackTintColor = .darkGray
        slider.setThumbImage(UIImage(systemName: "square.fill"), for: .normal)
        slider.setThumbImage(UIImage(systemName: "square.fill"), for: .selected)
        slider.tintColor = .black
    }
    
    // Backward, forward, play buttons
    fileprivate func configureHStack2 ()  -> UIStackView {
        mixImg.image = UIImage(systemName: "arrow.triangle.swap")
        mixImg.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        randomImg.image = UIImage(systemName: "arrow.counterclockwise")
        
        configureGoToStart()
        configurePlay()
        configureEnd()
        
        let array = [mixImg, goToStartButton, playButton, endButton, randomImg]
        let hStack = UIStackView(arrangedSubviews: array)
        hStack.axis = .horizontal
        hStack.spacing = 2
        hStack.distribution = .equalSpacing
        return hStack
    }
    
    //Configure backward button
    fileprivate func configureGoToStart () {
        goToStartButton.setImage(UIImage(systemName: "backward.end.fill"), for: .normal)
        goToStartButton.addTarget(self, action: #selector(forwardPressed), for: .touchUpInside)
    }
    
    //Configure pause button
    fileprivate func configurePlay () {
        playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        playButton.addTarget(self, action: #selector(playPressed), for: .touchUpInside)
    }
    //Configure forward  button
    fileprivate func configureEnd () {
        endButton.setImage(UIImage(systemName: "forward.end.fill"), for: .normal)
        endButton.addTarget(self, action: #selector(endPressed), for: .touchUpInside)
    }
    
}
