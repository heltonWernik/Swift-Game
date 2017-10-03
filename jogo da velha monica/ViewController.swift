//
//  ViewController.swift
//  jogo da velha monica
//
//  Created by Helton Wernik on 31/12/15.
//  Copyright © 2015 Connecta Rocks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var winnerLabel: UILabel!
    
    @IBOutlet var tabuleiro: UIImageView!
    
    var timer = NSTimer()
    
    var isAnimating = true

    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombination = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2 ,5 ,8], [0, 4, 8], [2, 4, 6]]
    
    var activePlayer = 1
    
    var gameActive = true
    
    var image = UIImage()
    
    
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        activePlayer = 1
        gameActive = true
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        tabuleiro.hidden = false
        gameOverImage.hidden = true
        playAgainButton.hidden = true
        winnerLabel.hidden = true
        
        gameOverImage.center = CGPointMake(gameOverImage.center.x - 500, gameOverImage.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
    }
    
    
    @IBOutlet var gameOverImage: UIImageView!
    
    @IBOutlet var button: UIButton!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && gameActive == true {
            
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1 {
                
                image = UIImage(named: "CebolinhaToy.png")!
                winnerLabel.text = "Cebolinha ganhou"
                activePlayer = 2
                
            } else {
                
                image = UIImage(named: "monicaToy.png")!
                winnerLabel.text = "Monica ganhou"
                activePlayer = 1

            }
            
            sender.setImage(image, forState: .Normal)
            print(sender.tag)
            
            for combination in winningCombination {
                
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    var winnerText = "Cebolinha"
            
                    if gameState [combination[0]] == 2 {
                        gameOverImage.image = UIImage(named:"monicaToy.png")
                        winnerText = "Monica ganhou"
                    }else{
                        gameOverImage.image = UIImage(named:"CebolinhaToy.png")
                    }
                    
                    // para esconder todos os botoes
                    
                     var button = UIButton()
                    for var i = 0; i < 9; i++ {
                        button = view.viewWithTag(i) as! UIButton
                        
                        button.setImage(nil, forState: .Normal)
                    }
                    
                    tabuleiro.hidden = true
                    gameOverImage.hidden = false
                    playAgainButton.hidden = false
                    winnerLabel.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.gameOverImage.center = CGPointMake(self.gameOverImage.center.x + 500, self.gameOverImage.center.y)
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 500, self.playAgainButton.center.y)

                    })
                    
                    print(winnerText)
                    gameActive = false
                    
                }
            }
            
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameOverImage.hidden = true
        playAgainButton.hidden = true
        winnerLabel.hidden = true
        
        gameOverImage.center = CGPointMake(gameOverImage.center.x - 500, gameOverImage.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

