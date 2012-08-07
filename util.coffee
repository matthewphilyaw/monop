module.exports = (->
    CreatePlayer : (id) ->
        id : id
        account :
            balance : 0
            hist_trans : []
            pend_trans : []

    CreateTransaction : (type, amount, detail) ->
        type : type
        amount : amount
        detail : detail

    ApplyTransactions : (player) ->
        player.account.pend_trans.forEach (trans) ->
            if trans.type == 'deposit'
                player.account.balance += trans.amount
            else if trans.type == 'debit'
                player.account.balance -= trans.amount
                
            len = player.account.hist_trans.length
            trans['id'] = len
            player.account.hist_trans.push(trans)

        player.account.pend_trans = []
        player)()
