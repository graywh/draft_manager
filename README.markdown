# Fantasy Draft Manager

A script to help manage your offline fantasy sports drafts.

Currently implemented in R, this script will read a tab-delimited text file of
draft picks and print some information including remaining auction budget,
maximum bid, and roster breakdown.

## Input File

    Position	Player	Price	Team
    RB	Arian Foster	50	Will
    RB	Adrian Peterson	48	Cole
    QB	Aaron Rodgers	45	Eric
    WR	Andre Johnson	30	Dave
    TE	Antonio Gates	25	Matt
    K	Alex Henery	1	John

## Usage

    $ ./script money
         Spent Balance Open Max.Bid
    Cole    48     152   28     125
    Dave    30     170   28     143
    Eric    45     155   28     128
    John     1     199   28     172
    Matt    25     175   28     148
    Will    50     150   28     123

    % ./script breakdown
         QB WR RB TE K DL LB DB Total
    Cole  0  0  1  0 0  0  0  0     1
    Dave  0  1  0  0 0  0  0  0     1
    Eric  1  0  0  0 0  0  0  0     1
    John  0  0  0  0 1  0  0  0     1
    Matt  0  0  0  1 0  0  0  0     1
    Will  0  0  1  0 0  0  0  0     1

    % ./script roster Matt
      Position        Player Price
    1       TE Antonio Gates    25
