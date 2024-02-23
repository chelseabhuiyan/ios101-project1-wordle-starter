//
//  ViewController.swift
//  Wordle
//
//  Created by Mari Batilando on 2/12/23.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var wordsCollectionView: UICollectionView!
  @IBOutlet weak var keyboardCollectionView: UICollectionView!

  private var boardController: BoardController!
  private var keyboardController: KeyboardController!

  override func viewDidLoad() {
    super.viewDidLoad()

    setupNavigationBar()

    boardController = BoardController(collectionView: wordsCollectionView)
    keyboardController = KeyboardController(collectionView: keyboardCollectionView)
    /*
      Exercise 3: Assign a closure to the `didSelectString` property of `keyboardController` (see KeyboardController.swift):
      
      This closure takes in a string (the string selected from the keyboard).
      If the string is equal to the `DELETE_KEY` constant (see Constants.swift), then call the `deleteLastCharacter` method of `boardController`.
      Else, it should use the `enter` method of `boardController` and pass in the selected string as the argument.
     */
    // START YOUR CODE HERE
      //tap on a keyboard cell and have the letter show or deleted on the board.
      keyboardController.didSelectString = { [weak self] selectedString in
              guard let self = self else { return }

              if selectedString == DELETE_KEY {
                  self.boardController.deleteLastCharacter()
              } else {
                  self.boardController.enter(selectedString)
              }
          }
      //This closure checks if the selected string is equal to the DELETE_KEY constant. If it is, it calls the deleteLastCharacter method of boardController. Otherwise, it calls the enter method and passes in the selected string.
    // END YOUR CODE HERE
  }
}
