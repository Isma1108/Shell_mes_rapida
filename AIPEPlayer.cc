#include "Player.hh"


/**
 * Write the name of your player and save this file
 * with the same name and .cc extension.
 */
#define PLAYER_NAME PEPlayer

// DISCLAIMER: The following Demo player is *not* meant to do anything
// sensible. It is provided just to illustrate how to use the API.
// Please use AINull.cc as a template for your player.

struct PLAYER_NAME : public Player {

  /**
   * Factory: returns a new instance of this class.
   * Do not modify this function.
   */
  static Player* factory () {
    return new PLAYER_NAME;
  }


  /**
   * Types and attributes for your player can be defined here.
   */
  const vector<Dir> dirs = {Up,Down,Left,Right};

  /**
   * Play method, invoked once per each round.
   */
  virtual void play () {
    return;
  }
};


/**
 * Do not modify the following line.
 */
RegisterPlayer(PLAYER_NAME);
