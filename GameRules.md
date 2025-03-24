# The ruleset of Liars Dice
## This is a file with the rules of the game, and which of them is implemented or not.

The style of game in RDR is a free for all elimination.  
The object of winning is to be the last player with at least one (1) die remaining.  
Players lose (are eliminated) by discarding all of their dice.   


<sub>Information from [RedDeadWiki](https://reddead.fandom.com/wiki/Liar%27s_Dice)</sub>

- ###  The Game Flow:
    - [ ] Each player has one cup and starts with five dice.
    - [ ] The game is started by choosing a player who will be the first to "bid."
    - [ ] The first round begins by all players picking up, shaking it, and slamming the cup upside down onto the table, thus concealing all dice. 
    - [ ] Each player may look at their dice and contemplate the mathematical probability of all dice on the table.
    - [ ] The player chosen before the game began then states their opening "bid". (Ex.: Number of faces in the table)
    - [ ] The action is then passed clockwise to the player sitting to the left of the starter. 
    - [ ] The second player may then do one of three things: raise the bid; call a bluff; or declare the bid spot-on. 
    - [ ] After a bluff or a spot-on bid is called, all players reveal their dice, and total the number of dice showing the face that was bid on.
    - [ ] The round is ended by at least one player discarding one die each.
    - After discarding a die, there is no way to regain it until the game is over and a new one begins.
    - [ ] To start the next round, all players must put their dice back into their cup, shake, slam and repeat the steps of the typical round as laid out above. 

### Bidding and Guessing

- #### After the first bid, there's three possible moves the player can make.
    - [ ] [Raising the bid.](#raise-bid)
    - [ ] [Calling a bluff.](#call-bluff)
    - [ ] [Declaring Spot-On.](#spot-on)



<a name="raise-bid"/>  

- ### Raising the bid: 
    - To raise a bid, the current bidder must either declare:
        - a higher number of total dice with any face value (for example, 4 twos beats 3 fours) 
        - increase the face of the dice last bid on (e.g., 3 fives beats 3 fours)
        - or both.

<a name="call-bluff"/>

- ### Calling a bluff:
    - If a player believes the last bid to be too high, they may call a bluff.
    - At this point, all players show their dice and total the face value bid upon.
    - If the total number of dice faces that matches value bid upon:
        - is more than the last bid: 
            - the player to last bid is safe for bidding under the true total.
            - the player calling the bluff discards one die for calling a bluff on a valid bid.
        - is less than the last bid:
            - the player to last bid discards one die for bidding over the true total.
            - the player calling the bluff is safe for accurately calling out a "lying" player. 

<a name="spot-on"/>

- ### Declaring Spot-on:
    -  If a player believes the last bid to be correct, they can declare the last bid "spot-on." 
    -  At this point, all players show their dice and total the face value bid upon.
    - If the total number of dice faces that matches value bid upon:
        - is greater or less than the last bid:
            -  The player who declared the bid spot-on discards one (1) die for inaccurately calling a bid spot-on.
            -  The player whose bid was declared spot-on is safe.
        - is exactly the same as the last bid:
            -  the player who declared the bid spot-on is safe.
            -  all other players discard one die each for getting caught with a spot-on bid. 
