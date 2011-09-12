# Fantasy Draft Manager

A script to help manage your offline fantasy sports drafts.

Currently implemented in R, this script reads a tab-delimited text file of
draft picks and prints some information including remaining auction budget,
maximum bid, and roster breakdown.

## Input File

    Position	Player	Price	Team
    RB	Arian Foster	50	Will
    RB	Adrian Peterson	48	Cole
    QB	Aaron Rodgers	45	Eric
    WR	Andre Johnson	30	Dave
    TE	Antonio Gates	25	Matt
    K	Alex Henery	1	John

Positions help with displaying the breakdown.  Player names can be "First
Last", "Last, First" or any other format you want.  Team names can also be in
any format you want.

## Usage

Just specify the command.  Some commands take an optional team name; others
require one.

### money

    $ ./script money
         Spent Balance Open Max.Bid
    Cole    48     152   28     125
    Dave    30     170   28     143
    Eric    45     155   28     128
    John     1     199   28     172
    Matt    25     175   28     148
    Will    50     150   28     123

    $ ./script money Eric
         Spent Balance Open Max.Bid
    Eric    45     155   28     128

### breakdown

    % ./script breakdown
         QB WR RB TE K DL LB DB Total
    Cole  0  0  1  0 0  0  0  0     1
    Dave  0  1  0  0 0  0  0  0     1
    Eric  1  0  0  0 0  0  0  0     1
    John  0  0  0  0 1  0  0  0     1
    Matt  0  0  0  1 0  0  0  0     1
    Will  0  0  1  0 0  0  0  0     1

    % ./script breakdown Dave
         QB WR RB TE K DL LB DB Total
    Dave  0  1  0  0 0  0  0  0     1

### roster

    % ./script roster Matt
      Position        Player Price
    1       TE Antonio Gates    25

## Configuration

There are a few setting that can be defined within the script.

### BUDGET

Your auction draft budget.

### ROSTER

The maximum size of the team rosters.

### POSITIONS

The set of positions used in the league.  List them in order you want them
displayed in the roster listing and breakdown table.
