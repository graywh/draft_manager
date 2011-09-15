getVar <- function(var, default) {
    new <- strsplit(Sys.getenv(var), ':')[[1]]
    if (length(new) == 0)
        new <- default
    new
}

read.draft <- function(file, positions, teams=NULL) {
    draft <- read.delim('draft', strip.white=TRUE, comment.char='#')
    draft$Position <- factor(draft$Position, positions)
    if (!is.null(teams)) draft$Team <- factor(draft$Team, teams)
    draft
}

filter <- function(team) {
    draft <- subset(draft, Team == team)
    draft$Team <- factor(draft$Team)
    draft
}

spent <- function() {
    aggregate(draft$Price, list(draft$Team), sum)[[2]]
}

ndrafted <- function() {
    aggregate(draft$Player, list(draft$Team), length)[[2]]
}

money <- function() {
    # print balance, max bid
    s <- spent()
    b <- BUDGET - s
    n <- ndrafted()
    o <- ROSTER - n
    m <- b - o + 1
    m[o == 0 | b == 0] <- NA
    data.frame(Spent=s, Balance=b, Open=o, Max.Bid=m, row.names=levels(draft$Team))
}

roster <- function(team) {
    # print roster
    draftLs <- filter(team)[, c('Position', 'Player', 'Price')]
    structure(do.call(rbind, split(draftLs, draftLs$Position)[POSITIONS]), row.names=1:nrow(draftLs))
}

breakdown <- function() {
    # print roster breakdown
    t <- table(draft$Team, draft$Position)[, POSITIONS, drop=FALSE]
    cbind(t, Total=rowSums(t))
}
