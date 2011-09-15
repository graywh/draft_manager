# Fantasy Draft Manager

A script to help manage your offline fantasy sports drafts.

Currently implemented in R, this script reads a tab-delimited text file of
draft picks and prints some information including remaining auction budget,
maximum bid, and roster breakdown.

## Input File

The input file should be a tab-delimited text file with columns for Player,
Position, Price, and Team. Order doesn't matter as long as the column headers
match. Extra whitespace is stripped.

    Player      	Position	NFL.Team	Price	Team
    Aaron Rodgers	QB      	GB      	45	Eric
    Adrian Peterson	RB      	MIN     	48	Cole
    Alex Henery 	K       	PHI     	 1	John
    Andre Johnson	WR      	HOU     	30	Dave
    Antonio Gates	TE      	SD      	25	Matt
    Arian Foster	RB      	HOU     	50	Will

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

There are a few setting that can be defined by shell environment variables.

### BUDGET

Your auction draft budget. Defaults to 200. A list can be given if the
budgets need to be customized by team.

    export BUDGET=300

Or

    export BUDGET=210:190:200:200:200:200

### ROSTER

The maximum size of the team rosters. Defaults to 15. A list can be given if
the roster sizes need to be customized by team.

    export ROSTER=25

Or

    export ROSTER=16:14:15:15:15:15

### POSITIONS

The set of positions used in the league. List them in the order you want them
displayed in the roster listing and breakdown table.

    export POSITIONS=QB:WR:RB:TE:K:DEF

### TEAMS

The list of team names. List them in the order you want them displayed in the
money and roster breakdown tables.

    export TEAMS=Will:Cole:Eric:John:Matt:Dave
