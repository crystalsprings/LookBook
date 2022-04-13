//
//  ViewController.swift
//  LookBook
//
//  Created by Janice Flint on 4/9/22.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    @IBOutlet var imageAnimate: UIImageView!
    
    @IBOutlet var formalName: UILabel!
    @IBOutlet var formalNameAnimate: UILabel!
    
    @IBOutlet var position: UILabel!
    @IBOutlet var positionAnimate: UILabel!

    @IBOutlet var bio: UITextView!
    @IBOutlet var bioAnimate: UITextView!
    
    var deck = [NSDictionary]()
//    var include = [String]()
    var dateModified = Date()
    var deckPosition = 0

    var deckOrder = [Int]()
    
    var soundURL: URL?
    var soundID: SystemSoundID = 0
    
    var animationInProgress = "No"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeDeck()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)


        // Create the URL for the source audio file
        let filePath = Bundle.main.path(forResource: "Whoosh", ofType: "aiff")
        // Store the URL as a CFURL instance
        soundURL = URL(fileURLWithPath: filePath!)
        // Create a system sound object representing the audio file
        AudioServicesCreateSystemSoundID(soundURL! as CFURL, &soundID)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.shuffleDeck()
        deckPosition = 0
        
        let personInfo = deck[deckOrder[deckPosition]] as! [String:String]
        let personName = personInfo["formalName"]
        let personPosition = personInfo["title"]
        let personBio = personInfo["bio"]
        let imageName = personInfo["image"]
        
        formalName?.text = personName
        position?.text = personPosition
        bio?.text = personBio
        image?.image = UIImage(named: imageName!)
        
        formalNameAnimate.bounds = formalName.bounds
        positionAnimate.bounds = position.bounds
        bioAnimate.bounds = bio.bounds
        imageAnimate.bounds = image.bounds
        
        formalNameAnimate.isHidden = true
        positionAnimate.isHidden = true
        bioAnimate.isHidden = true
        imageAnimate.isHidden = true
    }
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            if self.animationInProgress == "No" {
                self.animationInProgress = "Yes"
                var personInfo = [String:String]()
                switch swipeGesture.direction {
                    //backwards previous
                case UISwipeGestureRecognizer.Direction.right:
                    // decrement deck position until a found card
                    repeat {
                        deckPosition -= 1
                         if self.deckPosition == -1 {
                            self.deckPosition = deck.count - 1
                        }
                        personInfo = deck[deckOrder[deckPosition]] as! [String:String]
                    } while personInfo["include"] == "No"
                    self.swipeCard(swipeDirection: "swipedRight")
                    
                case UISwipeGestureRecognizer.Direction.down:
                    print("Swiped down")
                    AudioServicesPlaySystemSound(soundID)

                case UISwipeGestureRecognizer.Direction.left:
                    // increment deck position until a found card
                    repeat {
                        deckPosition += 1
                        if deckPosition == deck.count {
                            deckPosition = 0
                        }
                        personInfo = deck[deckOrder[deckPosition]] as! [String:String]
                    } while personInfo["include"] == "No"
                    self.swipeCard(swipeDirection: "swipedLeft")

                case UISwipeGestureRecognizer.Direction.up:
                    print("Swiped up")
                    AudioServicesPlaySystemSound(soundID)
                    self.animationInProgress = "No"

                default:
                    break
                }
            }
        }
  
    }
 
    func swipeCard(swipeDirection: String) {
        var animationShift = self.view.bounds.width // swiped Left direction
        if swipeDirection == "swipedRight" {
            animationShift = -animationShift
        }
        // Set up next card in 'Animate' fields
        // set data for new card in 'animate' fields
        let personInfo = deck[deckOrder[deckPosition]] as! [String:String]
        let personName = personInfo["formalName"]
        let personPosition = personInfo["title"]
        let personBio = personInfo["bio"]
        let imageName = personInfo["image"]
        
        formalNameAnimate?.text = personName
        positionAnimate?.text = personPosition
        bioAnimate?.text = personBio
        imageAnimate?.image = UIImage(named: imageName!)

        
        self.formalNameAnimate.center.x = self.formalName.center.x + animationShift
        self.positionAnimate.center.x = self.position.center.x + animationShift
        self.bioAnimate.center.x = self.bio.center.x + animationShift
        self.imageAnimate.center.x = self.image.center.x + animationShift
        formalNameAnimate.isHidden = false
        positionAnimate.isHidden = false
        bioAnimate.isHidden = false
        imageAnimate.isHidden = false
        
        UIView.animate(withDuration: 0.3, delay: 0,
                       options: [], animations: {
                        self.formalName.center.x -= animationShift
                        self.position.center.x -= animationShift
                        self.bio.center.x -= animationShift
                        self.image.center.x -= animationShift
                        self.formalNameAnimate.center.x -= animationShift
                        self.positionAnimate.center.x -= animationShift
                        self.bioAnimate.center.x -= animationShift
                        self.imageAnimate.center.x -= animationShift
        }, completion: { (finished: Bool) in
            print("Swiped left")
            // put 'Animate' card info in regular card
            self.formalName?.text = self.formalNameAnimate?.text
            self.position?.text = self.positionAnimate?.text
            self.bio?.text = self.bioAnimate?.text
            self.image?.image = self.imageAnimate?.image
            // Move regular card in center position
            self.formalName.center.x = self.formalNameAnimate.center.x
            self.position.center.x = self.positionAnimate.center.x
            self.bio.center.x = self.bioAnimate.center.x
            self.image.center.x = self.imageAnimate.center.x
            // Hide "Animate fields
            self.formalNameAnimate.isHidden = true // don't need this field
            self.positionAnimate.isHidden = true
            self.bioAnimate.isHidden = true
            self.imageAnimate.isHidden = true
            // Enable the new regular buttons, animation over
            self.animationInProgress = "No"
        })
    }
    func initializeDeck() {
            deck = UserDefaults.standard.array(forKey: "deck") as! Array
            dateModified = UserDefaults.standard.object(forKey: "dateModified") as! Date
            print("Deck",deck)
        }

    func shuffleDeck() {
        //  Initialize deckOrderedAssigned with false
        var deckOrderAssigned = [Bool]()
        for  card in deck {
            deckOrderAssigned += [false]
            print(card["formalName"]!)
        }
        
        // Assign a Position for each card in Deck
        var newPosition = 0
        var positionFound = false
        for _ in 1...deck.count {
            positionFound = false
            while positionFound == false {
                newPosition = Int(arc4random_uniform(UInt32(deck.count)))
                if deckOrderAssigned[newPosition] == false {
                    deckOrderAssigned[newPosition] = true
                    positionFound = true
                    deckOrder += [newPosition]
                    print(newPosition)
                }
            }
        }
    }

}

