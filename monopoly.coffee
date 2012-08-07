module.exports = (->
    util = require('./util.js')

    transfer = (one, many, amount, debit) ->
        one_type = ''
        many_type = ''
        
        if (debit)
            one_type = 'debit'
            many_type = 'deposit'
        else
            one_type = 'deposit'
            many_type = 'debit'

        one.account.pend_trans.push(util.CreateTransaction(one_type, amount, null)) for [0..many.length-1]
        util.ApplyTransactions(one)
        
        many.forEach (item) ->
            item.account.pend_trans.push(util.CreateTransaction(many_type, amount, null))
            util.ApplyTransactions(item)

    PayRent : (landlord, tennant, amount) ->
        landlord.account.pend_trans.push(util.CreateTransaction('deposit', amount, null))
        tennant.account.pend_trans.push(util.CreateTransaction('debit', amount, null))
        util.ApplyTransactions(landlord)
        util.ApplyTransactions(tennant)
    
    CreatePlayers : (number, startingAmount) ->
        players = []
        for num in [0..number - 1]
            players[num] = util.CreatePlayer(num)
            players[num].account.balance = startingAmount

        players

    PayPlayers : (from, to, amount) ->
        transfer(from, to, amount, true)

    PayPlayer : (from, to, amount) ->
        transfer(to, from, amount, false)
)()
