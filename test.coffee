util = require('./util.js')
mon = require('./monopoly.js')

players = mon.CreatePlayers(4, 1500)
console.log(players)

mon.PayRent(players[0], players[3], 500)
console.log player.account for player in players
console.log "\n"

[0..1000].forEach ->
    mon.PayPlayers(players[0], [players[2], players[3], players[1]], 400)
    mon.PayPlayer([players[1], players[2]], players[3], 12)

console.log player.account for player in players
